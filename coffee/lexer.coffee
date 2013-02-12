class DescentLexer
  constructor: (@rules) ->
  lex: ->
    return 'EOF' if @cursor >= @input.length
    matches = for rule in @rule
      rule: rule
      match: rule.appliesTo @input[@cursor]
    matches = (match for match in matches when match.match)

    throw "no match found at #{@cursor} for input:\n#{@input}" if matches.length is 0

    longest = matches[0]
    for match in matches
      longest = match if match[1].length > longest[1].length

  setInput: (@input) ->
    @cursor = 0
    @indent = 0

class Rule
  constructor: (@pattern, @token) ->
  appliesTo: (part) ->
    match = @pattern.match part
    match[0] ? false

module.exports = DescentLexer
