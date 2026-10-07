% The Collatz (hailstone) sequence: halve an even number, or triple it
% and add one if odd, repeating until reaching 1. Conjectured to always
% terminate, though no proof is known.
collatz(1, [1]) :- !.
collatz(N, [N|Rest]) :-
    N > 1,
    ( 0 is N mod 2 -> N1 is N // 2 ; N1 is 3 * N + 1 ),
    collatz(N1, Rest).

collatz_length(N, Length) :- collatz(N, Seq), length(Seq, Length).

:- collatz(6, Seq), writeln(Seq).
:- collatz_length(27, Len), writeln(Len).
