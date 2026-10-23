% Woodall numbers: W(n) = n * 2^n - 1
woodall(N, W) :- W is N * 2 ^ N - 1.

:- numlist(1, 10, Ns),
   maplist(woodall, Ns, Ws),
   atomic_list_concat(Ws, ' ', Line),
   writeln(Line).
