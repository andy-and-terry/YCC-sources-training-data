price(apple, 3). price(pear, 5). price(fig, 7).

:- aggregate_all(sum(P), price(_, P), T), aggregate_all(max(P-N), price(N, P), Max), format("~w ~w~n", [T, Max]).
