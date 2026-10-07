% A perfect number equals the sum of its own proper divisors, e.g.
% 6 = 1 + 2 + 3.
divisor_sum(N, Sum) :-
    N1 is N - 1,
    numlist(1, N1, Candidates),
    include([D]>>(0 is N mod D), Candidates, Divisors),
    sum_list(Divisors, Sum).

is_perfect(N) :- N > 1, divisor_sum(N, N).

:- findall(N, (between(1, 1000, N), is_perfect(N)), Perfects), writeln(Perfects).
:- ( is_perfect(28) -> writeln(true) ; writeln(false) ).
:- ( is_perfect(12) -> writeln(true) ; writeln(false) ).
