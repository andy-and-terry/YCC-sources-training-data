min_coins(_, 0, 0) :- !.
min_coins(Coins, Amount, Result) :-
    Amount > 0,
    findall(Count,
        (member(C, Coins), C =< Amount, Amount1 is Amount - C,
         min_coins(Coins, Amount1, SubCount), Count is SubCount + 1),
        Counts),
    Counts \= [],
    min_list(Counts, Result).

:- min_coins([1,2,5], 11, Result), writeln(Result).
