% Cullen numbers: C(n) = n * 2^n + 1
cullen(N, C) :- C is N * 2 ^ N + 1.

:- numlist(0, 9, Ns),
   maplist(cullen, Ns, Cs),
   atomic_list_concat(Cs, ' ', Line),
   writeln(Line).
