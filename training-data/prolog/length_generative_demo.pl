:- length(L, 3), writeln(L).

:- length(L, N), N >= 2, !, writeln(L-N).

% length/2 enumerates lists of increasing size when both arguments are unbound.
:- findall(L, (between(0, 2, N), length(L, N)), Ls), length(Ls, Count), writeln(Count).

:- length([a, b|T], 5), writeln(T).

% Generate all binary strings of a given length.
bits(N, Bits) :- length(Bits, N), maplist([B]>>member(B, [0, 1]), Bits).
:- findall(B, bits(3, B), All), length(All, Total), writeln(Total), writeln(All).
