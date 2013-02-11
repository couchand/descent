Foobar
  doNothing ->
  square (int x) -> x * x
  cube (int x) -> square(x) * x
  add (int a, int b) -> a + b
  log (str msg) ->
    System.log msg
DefaultValues
  fill (str container, str liquid = 'coffee') ->
    'Filling the #{container} with #{liquid}.'
