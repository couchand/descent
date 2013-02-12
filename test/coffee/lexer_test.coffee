dl = require '../../coffee/lexer.js'

assertEqual = (actual, expected, msg) ->
  throw "Assertion failed.  Expected #{actual} to equal #{expected}: #{msg}." if actual isnt expected

#describe 'DescentLexer', ->
#  describe 'lex', ->
#    it 'lexes', ->
lexer = new dl.DescentLexer()
lexer.rules = [
  new dl.Rule /^foo/, 'FOO'
  new dl.Rule /^bar/, 'BAR'
  new dl.Rule /^baz/, 'BAZ'
]
lexer.setInput 'foofoobarbarfoo'

assertEqual lexer.lex(), 'FOO', '1'
assertEqual lexer.lex(), 'FOO', '2'
assertEqual lexer.lex(), 'BAR', '3'
assertEqual lexer.lex(), 'BAR', '4'
assertEqual lexer.lex(), 'FOO', '2'
assertEqual lexer.lex(), 'EOF', '5'


# newlines and indents

lexer.setInput 'foo\n  bar\n  baz\n\nfoo\n  bar\n    baz\n  foo'

assertEqual lexer.lex(), 'FOO'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'INDENT'
assertEqual lexer.lex(), 'BAR'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'BAZ'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'DEDENT'
assertEqual lexer.lex(), 'FOO'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'INDENT'
assertEqual lexer.lex(), 'BAR'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'INDENT'
assertEqual lexer.lex(), 'BAZ'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'DEDENT'
assertEqual lexer.lex(), 'FOO'
assertEqual lexer.lex(), 'EOF'
