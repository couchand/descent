# descent rewriter

rr = require './rewriter.js'

basicRewriter = new rr.Rewriter()

#basicRewriter.rules.push new rr.RewriteRule /^  [a-z].*->.*$/, /^  /, '  METHOD'
#basicRewriter.rules.push new rr.RewriteRule /^  [A-Z][a-z].*$/, /^  /, '  CLASS'
#basicRewriter.rules.push new rr.RewriteRule /^  [A-Z_]+/, /^  /, '  FINAL'

r = (needle, flag, replacing) ->
  vis = "((global|public|readable|private) )?"
  pat = new RegExp "^  #{vis}#{needle}.*$"
  replacer = if replacing? then new RegExp "^  #{replacing}" else /^  /
  basicRewriter.rules.push new rr.RewriteRule pat, replacer, "  #{flag} "

# prepend final glyph to constant declarations
r '[A-Z][A-Z_]+', '{?FINAL?}'
# prepend function glyph to method declarations
r '[a-z].*->', '{?METHOD?}'
# prepend class glyph to inner class declarations
r '[A-Z][a-z]', '{?CLASS?}'
# replace static glyph on class-level members
r '::', '{?STATIC?}', '::'

module.exports = basicRewriter
