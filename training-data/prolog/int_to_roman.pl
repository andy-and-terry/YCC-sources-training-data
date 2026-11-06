% Integer (1..3999) to Roman numeral using a greedy table.
table([1000-"M", 900-"CM", 500-"D", 400-"CD", 100-"C", 90-"XC",
       50-"L", 40-"XL", 10-"X", 9-"IX", 5-"V", 4-"IV", 1-"I"]).

to_roman(N, R) :- table(T), to_roman(N, T, "", R).

to_roman(0, _, Acc, Acc) :- !.
to_roman(N, [V-S|Rest], Acc, R) :-
    (   N >= V
    ->  N1 is N - V, string_concat(Acc, S, Acc1), to_roman(N1, [V-S|Rest], Acc1, R)
    ;   to_roman(N, Rest, Acc, R)
    ).

:- to_roman(1994, A), to_roman(58, B), format("~s ~s~n", [A, B]).
