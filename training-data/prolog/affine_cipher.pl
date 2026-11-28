affine_char(A, B, Code, Out) :-
    ( Code >= 0'A, Code =< 0'Z ->
        X is Code - 0'A,
        Y is (A * X + B) mod 26,
        Out is Y + 0'A
    ; Out = Code ).

affine(A, B, Text, Out) :-
    string_codes(Text, Codes),
    maplist(affine_char(A, B), Codes, OutCodes),
    string_codes(Out, OutCodes).

:- affine(5, 8, "AFFINE", S), write(S), nl.
