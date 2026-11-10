% Read the binary digits of I as base-4 digits.
moser(0, 0) :- !.
moser(I, V) :-
    Bit is I /\ 1, Rest is I >> 1,
    moser(Rest, V0),
    V is Bit + 4 * V0.

main :- findall(V, (between(0, 9, I), moser(I, V)), L), write(L), nl.
% [0,1,4,5,16,17,20,21,64,65]
:- initialization(main).
