Aliases
  in ->
    catColors = { 'Igor': 'black', 'Peggy Sue': 'tortiseshell' }
    if someCat in catColors
      System.log 'my cat'
    for cat of catColors
      System.log cat + ' is ' + catColors[cat]
