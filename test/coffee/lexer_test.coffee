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
]
lexer.setInput 'foofoobarbarfoo'

assertEqual lexer.lex(), 'FOO', '1'
assertEqual lexer.lex(), 'FOO', '2'
assertEqual lexer.lex(), 'BAR', '3'
assertEqual lexer.lex(), 'BAR', '4'
assertEqual lexer.lex(), 'FOO', '5'
