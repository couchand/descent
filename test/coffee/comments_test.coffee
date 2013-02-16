p = require '../../dst/parser.js'

assertParses = (str, msg) ->
  throw "Assertion failed.  Expected #{str} to parse: #{msg}." if !p.parse str

assertParses '# This is foobar.\nFoobar\n  thing\n', 'comments before the class should be ignored'
assertParses 'Foobar\n# This is foobar.\n  thing\n', 'comments within the class should be ignored'
assertParses 'Foobar\n  thing\n# This is foobar.\n', 'comments after the class should be ignored'
assertParses 'FOobar # This is foobar.\n  thing\n', 'end-of-line comments should be ignored'
