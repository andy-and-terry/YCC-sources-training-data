isbn10_valid(Isbn) :-
    atom_chars(Isbn, Chars0),
    exclude(==('-'), Chars0, Chars),
    length(Chars, 10),
    maplist(isbn_digit, Chars, Values),
    weighted_sum(Values, 10, 0, Sum),
    0 is Sum mod 11.

isbn_digit('X', 10) :- !.
isbn_digit(C, V) :- char_type(C, digit(V)).

weighted_sum([], _, S, S).
weighted_sum([V|Vs], W, Acc, S) :-
    Acc1 is Acc + V * W,
    W1 is W - 1,
    weighted_sum(Vs, W1, Acc1, S).

:- forall(member(I, ['3-598-21508-8', '3-598-21507-X', '3-598-2K507-0']),
          ( isbn10_valid(I) -> format("~w valid~n", [I]) ; format("~w invalid~n", [I]) )).
