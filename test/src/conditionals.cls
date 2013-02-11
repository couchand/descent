Postfix
  greatlyImproved = 'sunshine and rainbows'

  singing -> yes
  raining -> no
  goForPicnic -> print 'lovely day'

  check ->
    mood = greatlyImproved if singing
    goForPicnic() unless raining

Blocks
  happy = yes
  knowsIt = yes
  grounded = no

  clapHands -> print '*CLAP*'
  chaChaCha -> print 'cha-cha-cha'
  playHookey -> print 'going to arcade'

  check ->
    if happy and knowsIt
      clapHands()
      chaChaCha()
    else
      showIt()
    unless grounded
      playHookey()

Assignment
  sue = 'hot'
  jill = 'not'

  friday -> no
  check ->
    date = if friday then sue else jill

SwitchGenerate
  favoriteLanguage = 'Sass'

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
