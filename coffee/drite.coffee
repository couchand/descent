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
  vis = "((global|public|readable|private|\\{\\?[A-Z]*\\?\\}) )?"
  pat = regex "^  #{vis}#{needle}.*$"
  basicRewriter.rules.push if replacing? then rule pat, regex(replacing), "#{flag} " else rule pat, /^  /, "  #{flag} "

# prepend final glyph to constant declarations
r '[A-Z][A-Z_]+', '{?FINAL?}'
# replace static glyph on class-level members
r '::', '{?STATIC?}', '::'
# prepend function glyph to method declarations
r '[a-z].*->', '{?METHOD?}'
# prepend class glyph to inner class declarations
r '[A-Z][a-z]', '{?CLASS?}'

module.exports = basicRewriter
