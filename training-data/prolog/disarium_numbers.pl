% Disarium numbers: digits raised to their 1-based positions sum to n.
disarium(N) :-
    number_codes(N, Cs),
    foldl([C, I0-S0, I-S]>>(D is C - 48, I is I0 + 1, S is S0 + D ** I), Cs, 0-0, _-Sum),
    Sum =:= N.

main :-
    findall(N, (between(1, 999, N), disarium(N)), L),
    atomic_list_concat(L, ' ', A), writeln(A).

:- initialization((main, halt)).
