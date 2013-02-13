ast = require '../../dst/ast.js'

assertEqual = (actual, expected, msg) ->
  throw "Assertion failed.  Expected #{actual} to equal #{expected}: #{msg}." if actual isnt expected

mock = (val) -> new ast.Variable val

v = new ast.Variable 'foo'
assertEqual v.compile(), 'foo', 'variables should compile to their name'

i = new ast.IntLiteral '42'
assertEqual i.compile(), '42', 'int literals should compile to their value'

m = new ast.Method mock('foobar'), [mock('a'), mock('b'), mock('c')], [mock('1')]
assertEqual m.compile(), 'public void foobar( a, b, c )\n{\n    1\n}'
m = new ast.Method mock('foobar'), [], [mock('baz')]
assertEqual m.compile(), 'public void foobar()\n{\n    baz\n}'

p = new ast.Property mock('foobar'), null, mock('baz')
assertEqual p.compile(), 'public Object foobar\n{\n    get\n    {\n        if ( foobar == null )\n        {\n            foobar = baz;\n        }\n        return foobar;\n    }\n    set;\n}'
p = new ast.Property mock('foobar')
assertEqual p.compile(), 'public Object foobar\n{\n    get;\n    set;\n}'
p = new ast.Property mock('foobar'), ast.GLOBAL, mock('baz')
assertEqual p.compile(), 'global Object foobar\n{\n    get\n    {\n        if ( foobar == null )\n        {\n            foobar = baz;\n        }\n        return foobar;\n    }\n    set;\n}'
p = new ast.Property mock('foobar'), ast.PRIVATE
assertEqual p.compile(), 'private Object foobar\n{\n    get;\n    set;\n}'
