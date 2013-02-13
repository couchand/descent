p = require '../../dst/parser.js'

assertEqual = (actual, expected, msg) ->
  throw "Assertion failed.  Expected #{actual} to equal #{expected}: #{msg}." if actual isnt expected

validateClasses = (classes, baz_val='3') ->
  assertEqual classes.length, 2, 'there should be two classes'

  foobar = classes[0]
  brooklyn = classes[1]

  assertEqual foobar.name, 'Foobar', 'the class name should be parsed'
  assertEqual brooklyn.name, 'Brooklyn', 'the class name should be parsed'

  foobarProperties = foobar.properties
  brooklynProperties = brooklyn.properties

  assertEqual foobarProperties.length, 3
  assertEqual brooklynProperties.length, 1

  assertEqual foobarProperties[0].variable.name, 'foo', 'the variable should be the left hand side of the assignment'
  assertEqual foobarProperties[0].default_val.value, '1', 'the number should be the right hand side of the assignment'

  assertEqual foobarProperties[1].variable.name, 'bar', 'the variable should be the left hand side of the assignment'
  assertEqual foobarProperties[1].default_val.value, '2', 'the number should be the right hand side of the assignment'

  assertEqual foobarProperties[2].variable.name, 'baz', 'the variable should be the left hand side of the assignment'
  assertEqual foobarProperties[2].default_val.value, baz_val, 'the number should be the right hand side of the assignment' if baz_val
  assertEqual foobarProperties[2].default_val?, false, 'there is no default value' unless baz_val

  assertEqual brooklynProperties[0].variable.name, 'city', 'the left hand side name should be parsed'
  assertEqual brooklynProperties[0].default_val.value, '1', 'the right hand side name should be parsed'

classes = p.parse 'Foobar\n  foo = 1\n  bar = 2\n  baz = 3\n\nBrooklyn\n  city = 1\n'
validateClasses classes
classes = p.parse 'Foobar\n  foo=1\n  bar        =     2\n  baz=    3\n     \n\n     \nBrooklyn\n  city= 1\n'
validateClasses classes
classes = p.parse 'Foobar\n  foo = 1\n\n  bar = 2\n\n  baz = 3\nBrooklyn\n\n  city = 1\n'
validateClasses classes
classes = p.parse 'Foobar\n  foo=\n\n    1\n  bar   =\n\n\n    2\n\n  baz     =\n    3\nBrooklyn\n  city=\n    1\n'
validateClasses classes
classes = p.parse 'Foobar\n  foo = 1\n  bar = 2\n  baz\n\nBrooklyn\n  city = 1\n'
validateClasses classes, false

validateFoobar = (classes, params=[]) ->
  assertEqual classes.length, 1, 'just the one class'
  assertEqual classes[0].name, 'Foobar', 'the class name should be parsed'
  assertEqual classes[0].methods.length, 1, 'the class has a single method'
  assertEqual classes[0].methods[0].identifier.name, 'has', 'the method name should be parsed'
  assertEqual classes[0].methods[0].parameters.length, params.length, 'the parameters should be parsed'
  assertEqual classes[0].methods[0].body.length, 1, 'the method body has one line'
  assertEqual classes[0].methods[0].body[0].name, 'good', 'the declaration should be parsed'

classes = p.parse 'Foobar\n  has: ->\n    good\n'
validateFoobar classes
classes = p.parse 'Foobar\n  has:->\n    good\n'
validateFoobar classes
classes = p.parse 'Foobar\n  has: -> good\n'
validateFoobar classes
classes = p.parse 'Foobar\n  has: () ->\n    good\n'
validateFoobar classes
classes = p.parse 'Foobar\n  has:()-> good\n'
validateFoobar classes
classes = p.parse 'Foobar\n  has      :                (          )                   ->\n    good\n'
validateFoobar classes

classes = p.parse 'Foobar\n  has: (baz) ->\n    good\n'
validateFoobar classes, ['baz']
classes = p.parse 'Foobar\n  has: ( baz ) ->\n    good\n'
validateFoobar classes, ['baz']
classes = p.parse 'Foobar\n  has: (     baz    ) ->\n    good\n'
validateFoobar classes, ['baz']
classes = p.parse 'Foobar\n  has: ( baz, bam ) ->\n    good\n'
validateFoobar classes, ['baz', 'bam']
classes = p.parse 'Foobar\n  has: (baz,bam) ->\n    good\n'
validateFoobar classes, ['baz', 'bam']
