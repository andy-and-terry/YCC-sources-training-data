% Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
digit_power(0, 0) :- !.
digit_power(D, P) :- P is D ** D.

munchausen(N) :-
    number_codes(N, Cs),
    foldl([C, A0, A]>>(D is C - 48, digit_power(D, P), A is A0 + P), Cs, 0, Sum),
    Sum =:= N.

main :-
    findall(N, (between(1, 4999, N), munchausen(N)), L),
    atomic_list_concat(L, ' ', A), writeln(A).

:- initialization((main, halt)).
