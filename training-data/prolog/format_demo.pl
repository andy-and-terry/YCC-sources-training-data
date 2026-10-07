% format/2 directives: ~w (write), ~a (atom), ~d (integer with grouping
% via a column arg), ~p pairs, ~n newline, and ~t/~| column tabbing.
:- format("plain write: ~w~n", [hello(world)]).
:- format("atom: ~a, integer: ~d~n", [example, 42]).
:- format("grouped thousands: ~D~n", [1234567]).
:- format("padded: [~t~w~10|]~n", [abc]).
:- forall(member(Name-Score, [alice-91, bob-78, carol-85]),
          format("~a~t~20|~d~n", [Name, Score])).
