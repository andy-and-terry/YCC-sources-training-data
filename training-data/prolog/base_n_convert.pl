digit_char(D, C) :- D < 10, !, C is 0'0 + D.
digit_char(D, C) :- C is 0'a + D - 10.

to_base(0, _, "0") :- !.
to_base(N, Base, Str) :- to_base_(N, Base, [], Cs), string_codes(Str, Cs).

to_base_(0, _, Acc, Acc) :- !.
to_base_(N, B, Acc, Out) :-
    D is N mod B, digit_char(D, C),
    N1 is N // B,
    to_base_(N1, B, [C | Acc], Out).

:- forall(member(B, [2, 8, 16, 36]),
          ( to_base(255, B, S), format("255 in base ~d = ~s~n", [B, S]) )).
