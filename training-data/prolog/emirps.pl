prime(N) :- N >= 2, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

reverse_num(N, R) :- number_codes(N, Cs), reverse(Cs, Rs), number_codes(R, Rs).

emirp(N) :- reverse_num(N, R), R =\= N, prime(N), prime(R).

main :- findnsols(10, N, (between(2, inf, N), emirp(N)), [L]), !, write(L), nl.
% [13,17,31,37,71,73,79,97,107,113]
:- initialization(main).
