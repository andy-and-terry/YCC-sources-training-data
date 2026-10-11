luhn_valid(Number) :-
    atom_chars(Number, Chars),
    reverse(Chars, Rev),
    luhn_sum(Rev, 1, 0, Sum),
    0 is Sum mod 10.

luhn_sum([], _, Sum, Sum).
luhn_sum([C|Cs], Pos, Acc, Sum) :-
    atom_number(C, D),
    (   Pos =:= 2
    ->  D2 is D * 2, ( D2 > 9 -> V is D2 - 9 ; V = D2 ),
        Next = 1
    ;   V = D, Next = 2
    ),
    Acc1 is Acc + V,
    luhn_sum(Cs, Next, Acc1, Sum).

:- forall(member(N, ['4539578763621486', '1234567812345678', '79927398713']),
          ( luhn_valid(N) -> format("~w valid~n", [N]) ; format("~w invalid~n", [N]) )).
