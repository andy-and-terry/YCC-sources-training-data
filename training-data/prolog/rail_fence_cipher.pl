rail_of(I, Rails, R) :-
    Period is 2 * (Rails - 1),
    M is I mod Period,
    ( M < Rails -> R = M ; R is Period - M ).

encode(Text, Rails, Out) :-
    string_chars(Text, Cs),
    findall(R-I-C,
            ( nth0(I, Cs, C), rail_of(I, Rails, R) ),
            Keyed),
    msort(Keyed, Sorted),
    findall(C, member(_-_-C, Sorted), Out0),
    string_chars(Out, Out0).

:- encode("WEAREDISCOVERED", 3, S), writeln(S).
