binary_to_decimal(Str, Decimal) :-
    string_chars(Str, Chars),
    foldl([C,Acc,NewAcc]>>(atom_number(C, D), NewAcc is Acc * 2 + D), Chars, 0, Decimal).

:- binary_to_decimal("1011", D), writeln(D).
