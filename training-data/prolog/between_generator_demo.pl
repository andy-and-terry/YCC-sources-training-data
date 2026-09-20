pythagorean_triple(A, B, C) :-
    between(1, 20, C),
    between(1, C, B),
    between(1, B, A),
    A * A + B * B =:= C * C.

:- findall(A-B-C, pythagorean_triple(A, B, C), Triples),
   writeln(Triples).

:- findall(N, (between(1, 30, N), 0 is N mod 3, 0 is N mod 5), FizzBuzzNumbers),
   writeln(FizzBuzzNumbers).
