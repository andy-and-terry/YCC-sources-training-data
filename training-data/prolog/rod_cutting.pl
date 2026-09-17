price(1, 1). price(2, 5). price(3, 8). price(4, 9). price(5, 10). price(6, 17). price(7, 17). price(8, 20).

best_price(0, 0) :- !.
best_price(Len, Best) :-
    findall(Revenue,
        ( between(1, Len, Cut),
          price(Cut, Price),
          Remaining is Len - Cut,
          best_price(Remaining, RestBest),
          Revenue is Price + RestBest
        ),
        Revenues),
    max_list(Revenues, Best).

:- best_price(8, Best), format("max revenue for rod length 8: ~w~n", [Best]).
:- best_price(4, Best2), format("max revenue for rod length 4: ~w~n", [Best2]).
