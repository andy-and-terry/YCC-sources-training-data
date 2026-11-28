prime(N) :- N >= 2, \+ has_factor(N, 2).

has_factor(N, D) :- D * D =< N, ( N mod D =:= 0 ; D1 is D + 1, has_factor(N, D1) ).

palindrome(N) :-
    number_codes(N, Cs),
    reverse(Cs, Cs).

% ?- findall(N, (between(2, 199, N), palindrome(N), prime(N)), L).
% L = [2, 3, 5, 7, 11, 101, 131, 151, 181, 191].
