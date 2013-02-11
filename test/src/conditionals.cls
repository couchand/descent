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
    when 'Ruby'
      print 'Ruby is great'
    when 'JavaScript', 'ActionScript'
      print 'Love making web apps'
    when 'Descent'
      print 'Of course'
    else
      print "I don't know that one"
