% Longest palindromic substring via center expansion: try every centre
% (both single-character and between-character) and keep the widest.
expand(Text, Len, Left, Right, Lo, Hi) :-
    Left >= 0, Right < Len,
    sub_atom(Text, Left, 1, _, C1),
    sub_atom(Text, Right, 1, _, C2),
    C1 == C2, !,
    Left1 is Left - 1, Right1 is Right + 1,
    expand(Text, Len, Left1, Right1, Lo, Hi).
expand(_, _, Left, Right, Lo, Hi) :- Lo is Left + 1, Hi is Right - 1.

longest_palindrome(Text, Best) :-
    atom_length(Text, Len),
    findall(Lo-Hi,
        ( between(0, Len, Center),
          ( expand(Text, Len, Center, Center, Lo, Hi)
          ; C1 is Center + 1, expand(Text, Len, Center, C1, Lo, Hi)
          )
        ),
        Spans),
    longest_span(Spans, 0-(-1), BestLo-BestHi),
    BestLen is BestHi - BestLo + 1,
    ( BestLen > 0 -> sub_atom(Text, BestLo, BestLen, _, Best) ; Best = '' ).

longest_span([], Best, Best).
longest_span([Lo-Hi|Rest], BLo-BHi, Best) :-
    ( Hi - Lo > BHi - BLo -> longest_span(Rest, Lo-Hi, Best) ; longest_span(Rest, BLo-BHi, Best) ).

:- longest_palindrome(babad, Result), writeln(Result).
:- longest_palindrome(cbbd, Result), writeln(Result).
