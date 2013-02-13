Basic
  eat: (food) ->
    print "eating #{food}"

  menu: (num, item) ->
    print "#{num}.) #{item}"

  doStuff: ->
    eat food for food in ['toast', 'cheese', 'wine']

    courses = ['greens', 'caviar', 'truffles', 'roast', 'cake']
    menu i + 1, dish for dish, i in courses

    foods = ['broccoli', 'spinach', 'chocolate']
    eat food for food in foods when food isnt 'chocolate'

Comprehensions
  doStuff: ->
    countdown = (num for num in [10..1])

  maps: ->
    yearsOld = max: 10, ida: 9, tim: 11

    ages = for child, age of yearsOld
      "#{child} is #{age}"

WhileLoop
  studyingEconomics = yes
  supply = 5
  demand = 4

  buy: -> --supply
  sell: -> --demand

  econ101: ->
    if this.studyingEconomics
      buy()  while supply > demand
      sell() until supply > demand

  nurseryRhyme: ->
    num = 6
    lyrics = while num -= 1
      "#{num} little monkeys, jumping on the bed.
        One fell out and bumped his head."

  purgatory: ->
    loop
      econ101()
