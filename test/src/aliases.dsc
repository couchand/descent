Aliases
  tautology ->
    if 1 is 1 and 1 isnt 2
      if 1 is 2 or 1 isnt 2
        if on is true and yes is true
          if off is false and no is false
            print 'whew'
  confusing ->
    unless not off then print 'how did i get here?'
    print 'same question' unless not no

Example
  ignition = off
  volume = 11
  band = 'Peter, Paul, and Mary'
  answer = yes
  winner
  car = Car
  limit = 60

  launch ->
  letTheWildRumpusBegin ->
  accelerate ->
  pick -> 42

  useful (str name) ->
    @name = name

  doIt ->
    launch() if ignition is on
    volume = 10 if band isnt 'SpinalTap'
    letTheWildRumpusBegin() unless answer is no
    if car.speed < limit then accelerate()
    winner = yes if pick in [47, 92, 13]
    print "My name is #{@name}"

  SpinalTap
  Car
    ->
      @speed = 15
