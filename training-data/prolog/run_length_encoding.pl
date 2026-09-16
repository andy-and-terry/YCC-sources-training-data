encode([], []).
encode([X|Xs], [Count-X|Rest]) :-
    take_same(X, Xs, Matched, Remaining),
    length(Matched, MatchedLen),
    Count is MatchedLen + 1,
    encode(Remaining, Rest).

take_same(_, [], [], []).
take_same(X, [Y|Ys], [Y|Matched], Remaining) :-
    X == Y, !,
    take_same(X, Ys, Matched, Remaining).
take_same(_, Ys, [], Ys).

decode([], []).
decode([Count-X|Rest], Result) :-
    length(Repeated, Count),
    maplist(=(X), Repeated),
    decode(Rest, RestResult),
    append(Repeated, RestResult, Result).

:- atom_chars(aaabbbcca, Chars),
   encode(Chars, Encoded),
   writeln(Encoded),
   decode(Encoded, Decoded),
   atomic_list_concat(Decoded, Atom),
   writeln(Atom).
