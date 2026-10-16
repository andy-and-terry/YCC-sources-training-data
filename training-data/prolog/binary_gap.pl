% Longest run of zeros enclosed by ones in the binary form of N.
binary_gap(N, Gap) :-
    format(atom(Bits), '~2r', [N]),
    atom_chars(Bits, Chars),
    gaps(Chars, 0, false, 0, Gap).

gaps([], _, _, Best, Best).
gaps(['1'|T], Cur, Seen, Best0, Best) :-
    (   Seen == true, Cur > Best0 -> Best1 = Cur ; Best1 = Best0 ),
    gaps(T, 0, true, Best1, Best).
gaps(['0'|T], Cur, Seen, Best0, Best) :-
    Cur1 is Cur + 1,
    gaps(T, Cur1, Seen, Best0, Best).

:- forall(member(N, [1041, 32, 529, 15, 9]),
          ( binary_gap(N, G), format("~w -> ~w~n", [N, G]) )).
