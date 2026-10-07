% sort/2 removes duplicates; msort/2 keeps them; sort/4 picks key and order.
:- msort([b, a, c, a], L), write(L), nl.
:- sort([b, a, c, a], L), write(L), nl.
:- sort(0, @>=, [3, 1, 3, 2], L), write(L), nl.
:- sort(0, @>, [3, 1, 3, 2], L), write(L), nl.

people([p(zoe, 30), p(adam, 25), p(bea, 30)]).

:- people(Ps), sort(2, @>=, Ps, L), write(L), nl.
:- people(Ps), sort(1, @<, Ps, L), write(L), nl.
:- predsort([O, A, B]>>compare(O, A, B), [c, a, b], L), write(L), nl.
:- length(L, 2), write(L), nl.
