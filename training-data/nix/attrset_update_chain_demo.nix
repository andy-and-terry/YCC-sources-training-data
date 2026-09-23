let
  # Nix attrsets are immutable, so "updating" a record means producing a
  # new one with `//`. Chaining `//` left-to-right models a sequence of
  # state transitions, each building on the previous snapshot.
  initial = { balance = 100; history = [ ]; };

  deposit = amount: state: state // {
    balance = state.balance + amount;
    history = state.history ++ [ "deposit ${toString amount}" ];
  };

  withdraw = amount: state: state // {
    balance = state.balance - amount;
    history = state.history ++ [ "withdraw ${toString amount}" ];
  };

  final = withdraw 30 (deposit 50 (deposit 20 initial));
in
  final
