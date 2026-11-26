% Emirps below 200; expect 15.
prime(N) :- N > 1, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

rev(N, R) :- number_codes(N, Cs), reverse(Cs, Rs), number_codes(R, Rs).
:- aggregate_all(count, (between(2, 199, N), rev(N, R), R =\= N, prime(N), prime(R)), C), writeln(C).
