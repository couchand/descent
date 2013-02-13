p = require '../../dst/parser.js'

assertEqual = (actual, expected, msg) ->
  throw "Assertion failed.  Expected #{actual} to equal #{expected}: #{msg}." if actual isnt expected

classes = p.parse 'Foobar\n  foo = 1\n  bar = 2\n  baz = 3\n\nBrooklyn\n  city = 1\n'

assertEqual classes.length, 2, 'there should be two classes'

foobar = classes[0]
brooklyn = classes[1]

assertEqual foobar.length, 2, 'each class should have a name and a body'
assertEqual foobar[0], 'Foobar', 'the class name should be parsed'
assertEqual brooklyn.length, 2, 'each class should have a name and a body'
assertEqual brooklyn[0], 'Brooklyn', 'the class name should be parsed'

foobarProperties = foobar[1]
brooklynProperties = brooklyn[1]

assertEqual foobarProperties.length, 3
assertEqual brooklynProperties.length, 1

assertEqual foobarProperties[0][0], 'Assignment', 'the property should be an assignment'
assertEqual foobarProperties[0][1][0][0], 'var', 'the left hand side should be a variable'
assertEqual foobarProperties[0][1][0][1], 'foo', 'the variable should be the left hand side of the assignment'
assertEqual foobarProperties[0][1][1][0], 'num', 'the right hand side should be a number'
assertEqual foobarProperties[0][1][1][1], '1', 'the number should be the right hand side of the assignment'

assertEqual foobarProperties[1][0], 'Assignment', 'the property should be an assignment'
assertEqual foobarProperties[1][1][0][0], 'var', 'the left hand side should be a variable'
assertEqual foobarProperties[1][1][0][1], 'bar', 'the variable should be the left hand side of the assignment'
assertEqual foobarProperties[1][1][1][0], 'num', 'the right hand side should be a number'
assertEqual foobarProperties[1][1][1][1], '2', 'the number should be the right hand side of the assignment'

assertEqual foobarProperties[2][0], 'Assignment', 'the property should be an assignment'
assertEqual foobarProperties[2][1][0][0], 'var', 'the left hand side should be a variable'
assertEqual foobarProperties[2][1][0][1], 'baz', 'the variable should be the left hand side of the assignment'
assertEqual foobarProperties[2][1][1][0], 'num', 'the right hand side should be a number'
assertEqual foobarProperties[2][1][1][1], '3', 'the number should be the right hand side of the assignment'

assertEqual brooklynProperties[0][0], 'Assignment', 'the property should be an assignment'
assertEqual brooklynProperties[0][1][0][0], 'var', 'the left hand side should be a variable'
assertEqual brooklynProperties[0][1][0][1], 'city', 'the left hand side name should be parsed'
assertEqual brooklynProperties[0][1][1][0], 'num', 'the right hand side should be a number'
assertEqual brooklynProperties[0][1][1][1], '1', 'the right hand side name should be parsed'
