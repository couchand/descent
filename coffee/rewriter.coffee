# pre-lex rewriter for descent
#
# inspired by the rewriter for coffeescript, but ours is
# before the lexer to let us cheat at some things

'use strict'

class Rewriter
  constructor: ->
    @rules = []

  rewrite: (input) ->
    lines = []

    for line in input.split /\n/
      for rule in @rules
        line = rule.rewrite line
      lines.push line

    lines.join '\n'

class RewriteRule
  constructor: (@match_pattern, @replace_pattern, @replacement) ->
  rewrite: (line) ->
    if line.match @match_pattern
      line.replace @replace_pattern, @replacement
    else
      line

module.exports =
  Rewriter: Rewriter
  RewriteRule: RewriteRule
