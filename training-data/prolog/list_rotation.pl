% Rotating a list by splitting it into a prefix and suffix and swapping
% their order; rotating right by N is rotating left by Length - N.
rotate_left(List, N, Rotated) :-
    length(List, Len),
    N1 is N mod Len,
    length(Prefix, N1),
    append(Prefix, Suffix, List),
    append(Suffix, Prefix, Rotated).

rotate_right(List, N, Rotated) :-
    length(List, Len),
    N1 is (Len - N mod Len) mod Len,
    rotate_left(List, N1, Rotated).

:- rotate_left([1, 2, 3, 4, 5], 2, R), writeln(R).
:- rotate_right([1, 2, 3, 4, 5], 2, R), writeln(R).
