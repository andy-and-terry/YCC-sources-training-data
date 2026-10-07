zip([], [], []).
zip([X|Xs], [Y|Ys], [X-Y|Ps]) :- zip(Xs, Ys, Ps).

:- zip([1, 2, 3], [a, b, c], P), writeln(P).
:- zip(Xs, Ys, [x-1, y-2]), writeln(Xs-Ys).

:- pairs_keys_values(Ps, [a, b, c], [1, 2, 3]), writeln(Ps).
:- pairs_keys_values([k1-v1, k2-v2], Ks, Vs), writeln(Ks/Vs).
:- pairs_values([a-1, b-2], Vs), writeln(Vs).
:- transpose_pairs([a-1, b-2], T), writeln(T).
:- msort([b-2, a-9, c-1], S), keysort([b-2, a-9, c-1, a-3], K), writeln(S), writeln(K).
:- maplist([X, Y, X-Y]>>true, [1, 2], [p, q], L), writeln(L).
