class DescentLexer
  constructor: (@tabstop = 2) ->
    @rules = []
    @tabchar = ' '

  setInput: (@input) ->
    @cursor = 0
    @indent = 0
    @backlog = []
    @awaiting = []

  eof: ->
    @cursor >= @input.length

  lex: ->
    return @backlog.shift() if @backlog.length

    return @awaiting.shift() if @awaiting.length and @eof()
    return 'EOF' if @eof()

    newline_tokens = @checkForNewlines()
    return newline_tokens[0] if newline_tokens.length is 1
    if newline_tokens.length
      @backlog = newline_tokens
      return @backlog.shift()

    matches = @matchingRules()
    throw "no match found at #{@cursor} for input:\n#{@input}" if matches.length is 0
    longest = @longestOf matches
    @cursor += longest.match.length
    longest.rule.token

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

  checkForNewlines: ->
    return false unless @input[@cursor] is "\n"
    tokens = ['NEWLINE']
    @cursor++
    blank_lines = @input[@cursor..].match new RegExp "^(#{@tabchar}*\n)+"
    @cursor += blank_lines[0].length if blank_lines
    tab_chars = @input[@cursor..].match new RegExp "^#{@tabchar}+"
    tab_chars = if tab_chars then tab_chars[0].length else 0
    throw "out of tab sync at #{@cursor} of input:\n#{@input}" if tab_chars % @tabstop
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
    tokens

class Rule
  constructor: (@pattern, @token) ->
  appliesTo: (part) ->
    match = part.match @pattern
    if match then match[0] else false

basicLexer = new DescentLexer()
basicLexer.rules.push new Rule /^[a-zA-Z]+/, 'VAR'
basicLexer.rules.push new Rule /^[0-9]+/, 'NUM'
basicLexer.rules.push new Rule /^=/, '='

module.exports =
  DescentLexer: DescentLexer
  Rule: Rule
  basicLexer: basicLexer
