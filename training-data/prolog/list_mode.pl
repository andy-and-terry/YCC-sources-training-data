count_of(X, L, C) :- include(==(X), L, M), length(M, C).

modes(L, Modes) :-
    findall(C-X, (member(X, L), count_of(X, L, C)), Pairs),
    max_member(Top-_, Pairs),
    findall(X, member(Top-X, Pairs), Xs),
    sort(Xs, Modes).

:- modes([1,2,2,3,3,4], M), writeln(M).
