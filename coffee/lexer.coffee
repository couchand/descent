class TabbedLexer
  constructor: (@tabstop = 2) ->
    @rules = []
    @tabchar = ' '
    @commentchar = '#'

  setInput: (@input) ->
    @cursor = 0
    @indent = 0
    @row = 0
    @col = 0
    @backlog = []
    @awaiting = []

  eof: ->
    @cursor >= @input.length

  lex: ->
    return @backlog.shift() if @backlog.length

    return @awaiting.shift() if @awaiting.length and @eof()
    return 'EOF' if @eof()

    longest
    until longest?.rule?.token?
      @checkForComment()

      newline_tokens = @checkForNewlines()
      if newline_tokens.length
        return newline_tokens[0] if newline_tokens.length is 1
        @backlog = newline_tokens
        return @backlog.shift()

      longest = @getMatch()
      @cursor += longest.match.length
      @col += longest.match.length

    before = @cursor - longest.match.length
    @yytext = @input[before...@cursor]
    @yyleng = longest.match.length
    @yylineno = @row
    longest.rule.token

  getMatch: ->
    matches = @matchingRules()
    @lexingError "no match found" if matches.length is 0
    @longestOf matches

  matchingRules: ->
    matches = for rule in @rules
      rule: rule
      match: rule.appliesTo @input[@cursor..]
    (match for match in matches when match.match)

  longestOf: (matches) ->
    longest = matches[0]
    for match in matches
      longest = match if match.match.length > longest.match.length
    longest

  checkForComment: ->
    match = @input[@cursor..].match new RegExp "^#{@tabchar}*#{@commentchar}.*(?=\n)"
    return no unless match
    @cursor += match[0].length
    @col += match[0].length
    yes

  checkForNewlines: ->
    return [] unless @input[@cursor] is "\n"
    tokens = ['NEWLINE']
    @cursor++
    @row++
    @col = 0

    blank_lines = @input[@cursor..].match new RegExp "^(#{@tabchar}*(#{@commentchar}.*)?\n)+"
    if blank_lines
      @cursor += blank_lines[0].length
      newline_count = blank_lines[0].match /\n/g
      @row += newline_count.length

    tab_chars = @input[@cursor..].match new RegExp "^#{@tabchar}+"
    tab_chars = if tab_chars then tab_chars[0].length else 0
    @lexingError "out of tab sync" if tab_chars % @tabstop
    new_indent = tab_chars / @tabstop

    while new_indent > @indent
      tokens.push 'INDENT'
      @awaiting.push 'DEDENT'
      ++@indent
    while new_indent < @indent
      tokens.unshift 'DEDENT'
      @awaiting.shift 'DEDENT'
      --@indent

    @cursor += tab_chars
    @col += tab_chars
    tokens

  lexingError: (msg) ->
    inp = @pointTo @row, @col, @input
    throw "Lexing Error: #{msg} at row #{@row}, col #{@col}, cursor #{@cursor} of input:\n#{inp}"

  pointTo: (row, col, input) ->
    lines = input.split /\n/
    pointer = ''
    for i in [0...col]
      pointer += '-'
    pointer += '^'
    lines.splice row+1, 0, pointer
    lines.join '\n'

  showPosition: () ->
    @pointTo @row, @col, @input

class Rule
  constructor: (@pattern, @token) ->
  appliesTo: (part) ->
    match = part.match @pattern
    if match then match[0] else false

module.exports =
  TabbedLexer: TabbedLexer
  Rule: Rule
