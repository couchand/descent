Foobar
  song = ['do', 're', 'mi', 'fa', 'sol', 'la', 'ti', 'do']

  singers = { Jagger: 'Rock', Elvis: 'Roll' }

  bitlist = [
    1, 0, 1
    0, 0, 1
    1, 1, 0
  ]

  kids =
    brother:
      name: 'Max'
      age: 11
    sister:
      name: 'Ida'
      age: 9

Slice
  doIt ->
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    start   = numbers[0..2]
    middle  = numbers[3...6]
    end     = numbers[6..]
    copy    = numbers[..]

  replaceIt ->
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    numbers[3..6] = [-3, -4, -5, -6]
