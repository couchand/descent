Foobar ->
  doNothing ->
  square (x) -> x * x
  cube (x) -> square(x) * x
  add (a, b) -> a + b
  log (msg) ->
    System.debug msg
DefaultValues ->
  fill (container, liquid = 'coffee') ->
    'Filling the #{container} with #{liquid}.'
