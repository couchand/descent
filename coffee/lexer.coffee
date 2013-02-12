class DescentLexer
  constructor: (@rules) ->
  lex: ->
    return 'EOF' if @cursor >= @input.length
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
