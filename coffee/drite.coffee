# descent rewriter

rr = require './rewriter.js'

basicRewriter = new rr.Rewriter()

#basicRewriter.rules.push new rr.RewriteRule /^  [a-z].*->.*$/, /^  /, '  METHOD'
#basicRewriter.rules.push new rr.RewriteRule /^  [A-Z][a-z].*$/, /^  /, '  CLASS'
#basicRewriter.rules.push new rr.RewriteRule /^  [A-Z_]+/, /^  /, '  FINAL'

r = (needle, flag) ->
  vis = "((global|public|readable|private) )?"
  pat = new RegExp "^  #{vis}#{needle}.*$"
  basicRewriter.rules.push new rr.RewriteRule pat, /^  /, "  #{flag} "

# prepend final glyph to constant declarations
r '[A-Z][A-Z_]+', '{?FINAL?}'
# prepend function glyph to method declarations
r '[a-z].*->', '{?METHOD?}'
# prepend class glyph to inner class declarations
r '[A-Z][a-z]', '{?CLASS?}'

module.exports = basicRewriter
