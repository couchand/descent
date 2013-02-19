dl = require '../../dst/lexer.js'

assertEqual = (actual, expected, msg) ->
  throw "Assertion failed.  Expected #{actual} to equal #{expected}: #{msg}." if actual isnt expected

#describe 'TabbedLexer', ->
#  describe 'lex', ->
#    it 'lexes', ->
lexer = new dl.TabbedLexer()
lexer.rules = [
  new dl.Rule /^foo/, 'FOO'
  new dl.Rule /^bar/, 'BAR'
  new dl.Rule /^baz/, 'BAZ'
  new dl.Rule /^ /
]
lexer.setInput 'foo foo bar     barfoo'

assertEqual lexer.lex(), 'FOO', '1'
assertEqual lexer.lex(), 'FOO', '2'
assertEqual lexer.lex(), 'BAR', '3'
assertEqual lexer.lex(), 'BAR', '4'
assertEqual lexer.lex(), 'FOO', '2'
assertEqual lexer.lex(), 'EOF', '5'

# quoted strings

lexer.setInput "foo 'look at my string' bar"

assertEqual lexer.lex(), 'FOO', 'tokens before the string should lex'
assertEqual lexer.lex(), 'STRLITERAL', 'string literals should lex'
assertEqual lexer.lex(), 'BAR', 'tokens after the string should lex'

# newlines and indents

lexer.setInput 'foo\n  bar\n  baz\n\nfoo\n  bar\n    baz\n  foo'

assertEqual lexer.lex(), 'FOO'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'INDENT'
assertEqual lexer.lex(), 'BAR'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'BAZ'
assertEqual lexer.lex(), 'DEDENT'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'FOO'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'INDENT'
assertEqual lexer.lex(), 'BAR'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'INDENT'
assertEqual lexer.lex(), 'BAZ'
assertEqual lexer.lex(), 'DEDENT'
assertEqual lexer.lex(), 'NEWLINE'
assertEqual lexer.lex(), 'FOO'
assertEqual lexer.lex(), 'DEDENT'
assertEqual lexer.lex(), 'EOF'




l = new dl.TabbedLexer()

l.rules.push new dl.Rule /^[a-zA-Z][a-zA-Z0-9_]+/, 'IDENTIFIER'
l.rules.push new dl.Rule /^( |\t)/, 'WHITESPACE'
l.rules.push new dl.Rule /^=/, '='
l.rules.push new dl.Rule /^[0-9]+/, 'NUM'

l.setInput 'Foobar\n  myProperty = 5\n  otherProperty = 5\n\n  myFunction\n    innerVar = 7'

assertEqual l.lex(), 'IDENTIFIER'
assertEqual l.lex(), 'NEWLINE'
assertEqual l.lex(), 'INDENT'
assertEqual l.lex(), 'IDENTIFIER'
assertEqual l.lex(), 'WHITESPACE'
assertEqual l.lex(), '='
assertEqual l.lex(), 'WHITESPACE'
assertEqual l.lex(), 'NUM'
assertEqual l.lex(), 'NEWLINE'
assertEqual l.lex(), 'IDENTIFIER'
assertEqual l.lex(), 'WHITESPACE'
assertEqual l.lex(), '='
assertEqual l.lex(), 'WHITESPACE'
assertEqual l.lex(), 'NUM'
assertEqual l.lex(), 'NEWLINE'
assertEqual l.lex(), 'IDENTIFIER'
assertEqual l.lex(), 'NEWLINE'
assertEqual l.lex(), 'INDENT'
assertEqual l.lex(), 'IDENTIFIER'
assertEqual l.lex(), 'WHITESPACE'
assertEqual l.lex(), '='
assertEqual l.lex(), 'WHITESPACE'
assertEqual l.lex(), 'NUM'
assertEqual l.lex(), 'DEDENT'
assertEqual l.lex(), 'DEDENT'
assertEqual l.lex(), 'EOF'
