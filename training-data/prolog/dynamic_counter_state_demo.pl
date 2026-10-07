% Mutable state via dynamic facts: a counter with retract/assert.
:- dynamic counter/1.

counter(0).

next_value(V) :-
    retract(counter(Old)),
    V is Old + 1,
    assertz(counter(V)).

reset_counter :-
    retractall(counter(_)),
    assertz(counter(0)).

:- next_value(A), next_value(B), next_value(C), write([A, B, C]), nl.
:- reset_counter, counter(X), write(X), nl.

:- dynamic seen/1.

remember_new(X) :- seen(X), !, fail.
remember_new(X) :- assertz(seen(X)).

:- forall(member(X, [a, b, a, c, b]),
          ( remember_new(X) -> write(new(X)) ; write(dup(X)) )),
   nl.
