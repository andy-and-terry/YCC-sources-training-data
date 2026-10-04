:- initialization(main).

shift(Code, N, Out) :-
    (   between(0'a, 0'z, Code)
    ->  Out is (Code - 0'a + N) mod 26 + 0'a
    ;   Out = Code
    ).

caesar(Text, N, Result) :-
    string_codes(Text, Codes),
    maplist([C, O]>>shift(C, N, O), Codes, Out),
    string_codes(Result, Out).

main :-
    caesar("hello world", 3, Enc), writeln(Enc),
    caesar(Enc, 23, Dec), writeln(Dec).
