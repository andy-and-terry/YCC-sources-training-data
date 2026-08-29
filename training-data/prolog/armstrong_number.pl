digits(N, Digits) :-
    number_string(N, Str),
    string_chars(Str, Chars),
    maplist([C,D]>>(atom_number(C, D)), Chars, Digits).

is_armstrong(N) :-
    digits(N, Digits),
    length(Digits, Power),
    foldl([D,Acc,NewAcc]>>(NewAcc is Acc + D**Power), Digits, 0, Total),
    Total =:= N.

:- (is_armstrong(153) -> writeln(true) ; writeln(false)).
:- (is_armstrong(154) -> writeln(true) ; writeln(false)).
