p = require '../../dst/parser.js'

assertEqual = (actual, expected, msg) ->
  throw "Assertion failed.  Expected #{actual} to equal #{expected}: #{msg}." if actual isnt expected

classes = p.parse 'Foobar\n  foo=1\n  bar=2\n  baz=3\n\nBrooklyn\n  city=1'

assertEqual classes.length, 2, 'there should be two classes'

foobar = classes[0]
brooklyn = classes[1]

assertEqual foobar.length, 2, 'each class should have a name and a body'
assertEqual brooklyn.length, 2, 'each class should have a name and a body'

foobarProperties = foobar[1]
brooklynProperties = brooklyn[1]

assertEqual foobarProperties.length, 3
assertEqual brooklynProperties.length, 1
