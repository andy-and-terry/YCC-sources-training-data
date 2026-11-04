% zigzag(+String, +Rows, -Result)
zigzag(S, Rows, S) :- string_length(S, N), (Rows =:= 1 ; Rows >= N), !.
zigzag(S, Rows, Result) :-
    string_chars(S, Cs),
    Period is 2 * (Rows - 1),
    findall(R-C, (nth0(I, Cs, C), K is I mod Period, (K < Rows -> R = K ; R is Period - K)), Pairs),
    findall(C, (between(0, Rows, R0), member(R0-C, Pairs)), Out),
    string_chars(Result, Out).

:- zigzag("PAYPALISHIRING", 3, R), writeln(R).
