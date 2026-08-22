is_prime(N) :- N > 1, \+ has_divisor(N, 2).

has_divisor(N, D) :- D * D =< N, (N mod D =:= 0 -> true ; D1 is D + 1, has_divisor(N, D1)).

:- findall(N, (between(2, 20, N), is_prime(N)), Primes), writeln(Primes).
