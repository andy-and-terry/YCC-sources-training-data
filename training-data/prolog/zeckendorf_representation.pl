% Zeckendorf representation: greedy sum of non-consecutive Fibonacci numbers.
% fibs_down(Limit, A, B, Acc, Fibs): Fibs lists Fibonacci numbers <= Limit, largest first.
fibs_down(Limit, A, _, Acc, Acc) :- A > Limit, !.
fibs_down(Limit, A, B, Acc, Fibs) :-
    C is A + B,
    fibs_down(Limit, B, C, [A|Acc], Fibs).

greedy([], _, []).
greedy([F|Fs], Rest, [F|Parts]) :-
    F =< Rest, !,
    Rest1 is Rest - F,
    greedy(Fs, Rest1, Parts).
greedy([_|Fs], Rest, Parts) :-
    greedy(Fs, Rest, Parts).

zeckendorf(N, Parts) :-
    fibs_down(N, 1, 2, [], Fibs),
    greedy(Fibs, N, Parts).

:- zeckendorf(100, Parts),
   atomic_list_concat(Parts, ' ', Line),
   writeln(Line).
