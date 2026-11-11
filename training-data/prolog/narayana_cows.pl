% Narayana's cows N(n)=N(n-1)+N(n-3)
extend(Acc, Out) :-
    length(Acc, N),
    IA is N - 1, IB is N - 3,
    nth0(IA, Acc, X), nth0(IB, Acc, Y),
    Z is X + Y,
    append(Acc, [Z], Out).

grow(Acc, 10, Acc) :- !.
grow(Acc, Len, Out) :- extend(Acc, Next), L1 is Len + 1, grow(Next, L1, Out).

main :- grow([1, 1, 1], 3, Out), writeln(Out).

:- initialization(main).
