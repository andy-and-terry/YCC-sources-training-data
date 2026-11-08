% rail_fence(+Text, +Rails, -Cipher)
rail_index(I, Rails, R) :-
    P is 2 * (Rails - 1), M is I mod P,
    ( M < Rails -> R = M ; R is P - M ).

rail_fence(Text, Rails, Cipher) :-
    string_chars(Text, Cs),
    findall(R-I-C, (nth0(I, Cs, C), rail_index(I, Rails, R)), Tagged),
    msort(Tagged, Sorted),
    findall(C, member(_-_-C, Sorted), Out),
    string_chars(Cipher, Out).

:- rail_fence("WEAREDISCOVERED", 3, C), writeln(C).
