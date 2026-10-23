parent(tom, bob).
parent(tom, liz).
parent(ann, tom).

% Soft cut (*->) keeps all solutions of the condition, unlike ->
describe(X) :-
    (   parent(X, Child)
    *-> format("~w is a parent of ~w~n", [X, Child])
    ;   format("~w has no children~n", [X])
    ).

:- forall(member(P, [tom, bob]), describe(P)).

:- findall(C, (parent(tom, C) -> true ; C = none), L1), writeln(L1).
:- findall(C, (parent(tom, C) *-> true ; C = none), L2), writeln(L2).
