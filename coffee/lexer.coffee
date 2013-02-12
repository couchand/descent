class DescentLexer
  constructor: (@rules) ->
  lex: ->
    return 'EOF' if @cursor >= @input.length
    matches = for rule in @rules
      rule: rule
      match: rule.appliesTo @input[@cursor..]
    matches = (match for match in matches when match.match)
    throw "no match found at #{@cursor} for input:\n#{@input}" if matches.length is 0

    longest = matches[0]
    for match in matches
      longest = match if match.match.length > longest.match.length
    @cursor += longest.match.length
    longest.rule.token

  setInput: (@input) ->
    @cursor = 0
    @indent = 0

class Rule
  constructor: (@pattern, @token) ->
  appliesTo: (part) ->
    match = part.match @pattern
    if match then match[0] else false

module.exports =
  DescentLexer: DescentLexer
  Rule: Rule
