is_prime(N) :- N > 1, is_prime_helper(N, 2).

is_prime_helper(N, I) :- I * I > N, !.
is_prime_helper(N, I) :-
    N mod I =\= 0,
    I1 is I + 1,
    is_prime_helper(N, I1).

:- (is_prime(17) -> writeln(true) ; writeln(false)).
:- (is_prime(18) -> writeln(true) ; writeln(false)).
