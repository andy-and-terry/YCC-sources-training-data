let
  # An attrset with a `__functor` attribute can be called like a
  # function: `self` is bound to the attrset itself, so a "callable
  # object" can carry extra data alongside its behavior.
  mkAdder = n: {
    __functor = self: x: x + self.amount;
    amount = n;
  };

  add5 = mkAdder 5;
  add10 = mkAdder 10;

  # Functors compose: nesting one functor call inside another.
  mkMultiplier = factor: {
    __functor = self: x: x * self.factor;
    factor = factor;
  };

  double = mkMultiplier 2;
in
  {
    fiveAdded = add5 3;
    tenAdded = add10 3;
    doubledThenAdded = add5 (double 4);
  }
