% Bulls and Cows scoring for equal-length digit strings.
score(Secret, Guess, Bulls, Cows) :-
    string_chars(Secret, S),
    string_chars(Guess, G),
    pairs(S, G, Bulls, SRest, GRest),
    count_cows(GRest, SRest, Cows).

pairs([], [], 0, [], []).
pairs([X|Xs], [X|Ys], B, SR, GR) :- !,
    pairs(Xs, Ys, B0, SR, GR),
    B is B0 + 1.
pairs([X|Xs], [Y|Ys], B, [X|SR], [Y|GR]) :-
    pairs(Xs, Ys, B, SR, GR).

count_cows([], _, 0).
count_cows([G|Gs], Pool, C) :-
    (   select(G, Pool, Pool1)
    ->  count_cows(Gs, Pool1, C0), C is C0 + 1
    ;   count_cows(Gs, Pool, C)
    ).

:- score("1807", "7810", B, C), format("~d bull(s), ~d cow(s)~n", [B, C]).
