sieve(Limit, Primes) :-
    numlist(2, Limit, Candidates),
    sieve_helper(Candidates, Primes).

sieve_helper([], []).
sieve_helper([P|Rest], [P|Primes]) :-
    exclude([X]>>(0 is X mod P), Rest, Filtered),
    sieve_helper(Filtered, Primes).

:- sieve(50, Primes), writeln(Primes).
