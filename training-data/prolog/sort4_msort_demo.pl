% sort/4 sorts on a key with explicit order; msort/2 keeps duplicates.
:- msort([c, a, b, a], L), writeln(L).
:- sort(0, @>=, [3, 1, 2, 3], L), writeln(L).
:- sort(0, @<, [3, 1, 2, 3], L), writeln(L).
:- sort(2, @>=, [f(a, 1), f(b, 3), f(c, 2)], L), writeln(L).
:- sort(1, @=<, [p(b, 1), p(a, 2), p(b, 0)], L), writeln(L).
:- list_to_set([a, b, a, c, b], S), writeln(S).
:- predsort([O, A, B]>>compare(O, A, B), [3, 1, 2, 1], L), writeln(L).
