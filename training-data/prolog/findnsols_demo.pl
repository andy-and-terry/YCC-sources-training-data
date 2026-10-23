nat(0).
nat(N) :- nat(M), N is M + 1.

square_of_even(S) :- nat(N), N mod 2 =:= 0, S is N * N.

% Take only the first five solutions of an infinite generator.
:- findnsols(5, S, square_of_even(S), L), !, writeln(L).

% Fetch results in chunks via backtracking.
:- forall(findnsols(3, N, between(1, 8, N), Chunk), writeln(Chunk)).

% Compare with limit/2 from library(solution_sequences).
:- findall(S, limit(4, square_of_even(S)), L), writeln(L).
