vigenere(Text, Key, Mode, Result) :-
    string_upper(Text, Upper),
    string_upper(Key, KeyUpper),
    string_codes(Upper, Codes),
    string_codes(KeyUpper, KeyCodes),
    shift_all(Codes, KeyCodes, KeyCodes, Mode, Out),
    string_codes(Result, Out).

shift_all([], _, _, _, []).
shift_all([C|Cs], [], Key, Mode, Out) :- shift_all([C|Cs], Key, Key, Mode, Out).
shift_all([C|Cs], [K|Ks], Key, Mode, [R|Rs]) :-
    (   C >= 0'A, C =< 0'Z
    ->  Shift is K - 0'A,
        (   Mode == encrypt -> Delta = Shift ; Delta is -Shift ),
        R is (C - 0'A + Delta) mod 26 + 0'A,
        shift_all(Cs, Ks, Key, Mode, Rs)
    ;   R = C,
        shift_all(Cs, [K|Ks], Key, Mode, Rs)
    ).

:- vigenere("Attack at dawn", "LEMON", encrypt, E), writeln(E),
   vigenere(E, "LEMON", decrypt, D), writeln(D).
