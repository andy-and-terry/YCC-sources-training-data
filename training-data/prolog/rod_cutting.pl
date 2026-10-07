price(1, 1). price(2, 5). price(3, 8). price(4, 9).
price(5, 10). price(6, 17). price(7, 17). price(8, 20).

best_revenue(0, 0) :- !.
best_revenue(N, Best) :-
    N > 0,
    findall(Revenue,
        (price(Len, Price), Len =< N, Rest is N - Len,
         best_revenue(Rest, RestRevenue), Revenue is Price + RestRevenue),
        Revenues),
    Revenues \= [],
    max_list(Revenues, Best).

:- best_revenue(8, Best), writeln(Best).
