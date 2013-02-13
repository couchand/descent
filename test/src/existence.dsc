Exist
  mind = 'blown'
  str world
  str yeti
  lottery = Lottery

  basicCheck: ->
    solipsism = true if mind? and not world?

    speed = 0
    speed ?= 15

    footprints = yeti ? "bear"

  accessorVariant: ->
    zip = lottery.drawWinner()?.address?.zipcode

  Lottery
    drawWinner: ->
      Person

  Person
    Address address

  Address
    str zipcode
