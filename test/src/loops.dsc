Basic
  doStuff
    eat food for food in ['toast', 'cheese', 'wine']

    courses = ['greens', 'caviar', 'truffles', 'roast', 'cake']
    menu i + 1, dish for dish, i in courses

    foods = ['broccoli', 'spinach', 'chocolate']
    eat food for food in foods when food isnt 'chocolate'

Comprehensions
  doStuff
    countdown = (num for num in [10..1])

  maps
    yearsOld = max: 10, ida: 9, tim: 11

    ages = for child, age of yearsOld
      "#{child} is #{age}"
