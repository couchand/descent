MyMath
  PI = 3.14159265

Calculator
  area: (r) ->
    r * r * PI

test Calculator
  test area: ->
    radius = 3
    expected = 9 * PI
    calc = Calculator

    startTest

    actual = calc.area radius

    stopTest

    equal expected, actual, 'the area should be calculated'
