% Deficient numbers below 100; expect 76.
proper_sum(N, S) :- findall(D, (between(1, N, D), D < N, N mod D =:= 0), Ds), sum_list(Ds, S).
:- aggregate_all(count, (between(1, 99, N), proper_sum(N, S), S < N), C), writeln(C).
