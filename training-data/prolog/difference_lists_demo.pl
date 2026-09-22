% A difference list Head-Tail represents the list still missing its
% Tail suffix, letting append run in O(1) instead of O(n).

dl_append(A - B, B - C, A - C).

dl_to_list(A - [], A).

flatten_dl([], Result - Result).
flatten_dl([X | Xs], Result - Tail) :-
    ( is_list(X) ->
        flatten_dl(X, Result - Mid)
    ;
        Result = [X | Mid]
    ),
    flatten_dl(Xs, Mid - Tail).

:- dl_append([1, 2, 3 | X] - X, [4, 5 | Y] - Y, Combined - []),
   writeln(Combined).

:- flatten_dl([1, [2, 3], [4, [5, 6]], 7], Flat - []),
   writeln(Flat).
