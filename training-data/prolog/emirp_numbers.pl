prime(N) :- N >= 2, \+ has_factor(N, 2).

has_factor(N, D) :- D * D =< N, ( N mod D =:= 0 ; D1 is D + 1, has_factor(N, D1) ).

reverse_number(N, R) :-
    number_codes(N, Cs),
    reverse(Cs, Rs),
    number_codes(R, Rs).

emirp(P) :-
    prime(P),
    reverse_number(P, R),
    R =\= P,
    prime(R).

% ?- findall(P, (between(2, 199, P), emirp(P)), L).
% L = [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199].
