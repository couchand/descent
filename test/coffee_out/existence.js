// Generated by CoffeeScript 1.4.0
(function() {

  Exist(function() {
    var lottery, mind;
    mind = 'blown';
    str(world);
    str(yeti);
    lottery = Lottery;
    basicCheck(function() {
      var footprints, solipsism, speed;
      if ((mind != null) && !(typeof world !== "undefined" && world !== null)) {
        solipsism = true;
      }
      speed = 0;
      if (speed == null) {
        speed = 15;
      }
      return footprints = typeof yeti !== "undefined" && yeti !== null ? yeti : "bear";
    });
    accessorVariant(function() {
      var zip, _ref, _ref1;
      return zip = (_ref = lottery.drawWinner()) != null ? (_ref1 = _ref.address) != null ? _ref1.zipcode : void 0 : void 0;
    });
    Lottery(function() {
      return drawWinner(function() {
        return Person;
      });
    });
    Person(function() {
      return Address(address);
    });
    return Address(function() {
      return str(zipcode);
    });
  });

}).call(this);
