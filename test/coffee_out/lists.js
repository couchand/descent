// Generated by CoffeeScript 1.4.0
(function() {

  Literals(function() {
    var bitlist, singers, song;
    song = ['do', 're', 'mi', 'fa', 'sol', 'la', 'ti', 'do'];
    singers = {
      Jagger: 'Rock',
      Elvis: 'Roll'
    };
    return bitlist = [1, 0, 1, 0, 0, 1, 1, 1, 0];
  });

  Slice(function() {
    doIt(function() {
      var copy, end, middle, numbers, start;
      numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      start = numbers.slice(0, 3);
      middle = numbers.slice(3, 6);
      end = numbers.slice(6);
      return copy = numbers.slice(0);
    });
    return replaceIt(function() {
      var numbers, _ref;
      numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      return ([].splice.apply(numbers, [3, 4].concat(_ref = [-3, -4, -5, -6])), _ref);
    });
  });

}).call(this);