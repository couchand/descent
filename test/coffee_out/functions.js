// Generated by CoffeeScript 1.4.0
(function() {

  Foobar(function() {
    doNothing(function() {});
    square(function(x) {
      return x * x;
    });
    cube(function(x) {
      return square(x) * x;
    });
    add(function(a, b) {
      return a + b;
    });
    return log(function(msg) {
      return System.debug(msg);
    });
  });

  DefaultValues(function() {
    return fill(function(container, liquid) {
      if (liquid == null) {
        liquid = 'coffee';
      }
      return 'Filling the #{container} with #{liquid}.';
    });
  });

}).call(this);
