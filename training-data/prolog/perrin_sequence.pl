% Perrin sequence P(n)=P(n-2)+P(n-3)
extend(Acc, Out) :-
    length(Acc, N),
    IA is N - 2, IB is N - 3,
    nth0(IA, Acc, X), nth0(IB, Acc, Y),
    Z is X + Y,
    append(Acc, [Z], Out).

grow(Acc, 10, Acc) :- !.
grow(Acc, Len, Out) :- extend(Acc, Next), L1 is Len + 1, grow(Next, L1, Out).

main :- grow([3, 0, 2], 3, Out), writeln(Out).

:- initialization(main).
