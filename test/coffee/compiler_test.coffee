ast = require '../../dst/ast.js'

assertEqual = (actual, expected, msg) ->
  throw "Assertion failed.  Expected #{actual} to equal #{expected}: #{msg}." if actual isnt expected

v = new ast.Variable 'foo'
assertEqual v.compile(), 'foo', 'variables should compile to their name'

i = new ast.IntLiteral '42'
assertEqual i.compile(), '42', 'int literals should compile to their value'
