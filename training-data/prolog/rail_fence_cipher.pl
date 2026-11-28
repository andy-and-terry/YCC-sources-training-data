rail(I, K, R) :-
    Cycle is 2 * (K - 1),
    R0 is I mod Cycle,
    ( R0 < K -> R = R0 ; R is Cycle - R0 ).

encrypt(Text, K, Out) :-
    string_chars(Text, Chars),
    findall(R-I-C, (nth0(I, Chars, C), rail(I, K, R)), Triples),
    msort(Triples, Sorted),
    findall(C, member(_-_-C, Sorted), Cs),
    string_chars(Out, Cs).

:- encrypt("WEAREDISCOVERED", 3, S), write(S), nl.
