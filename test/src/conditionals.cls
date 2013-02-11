Postfix
  check ->
    mood = greatlyImproved if singing
    goForPicnic() unless raining

Blocks
  check ->
    if happy and knowsIt
      clapHands()
      chaChaCha()
    else
      showIt()
    unless grounded
      playHookey()

Assignment
  check ->
    date = if friday then sue else jill

SwitchGenerate
  check ->
    switch favoriteLanguage
    case 'Ruby'
      print 'Ruby is great'
    case 'JavaScript', 'ActionScript'
      print 'Love making web apps'
    case 'Descent'
      print 'Of course'
    default
      print "I don't know that one"
