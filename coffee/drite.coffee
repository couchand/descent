# descent rewriter

rr = require './rewriter.js'

basicRewriter = new rr.Rewriter()

#basicRewriter.rules.push new rr.RewriteRule /^  [a-z].*->.*$/, /^  /, '  METHOD'
#basicRewriter.rules.push new rr.RewriteRule /^  [A-Z][a-z].*$/, /^  /, '  CLASS'
#basicRewriter.rules.push new rr.RewriteRule /^  [A-Z_]+/, /^  /, '  FINAL'

regex = (pattern) -> new RegExp pattern

rule = (pattern, replacer, replacement) ->
  new rr.RewriteRule pattern, replacer, replacement

r = (needle, flag, replacing) ->
  vis = "((global|public|readable|private|{\\?[A-Z]*\\?}) +)*"
  pat = regex "^  (  )?#{vis}#{needle}.*$"
  basicRewriter.rules.push rule pat, /^  (  )?([a-zA-Z])/, "  $1#{flag} $2"

# prepend function glyph to method declarations
r '[a-z].*->', '{?METHOD?}'
# prepend class glyph to inner class declarations
r '[A-Z][a-z]', '{?CLASS?}'

module.exports = basicRewriter
