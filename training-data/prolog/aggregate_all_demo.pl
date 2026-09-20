score(alice, 90).
score(bob, 75).
score(carol, 60).
score(dave, 90).

:- aggregate_all(count, score(_, _), Count), format("count: ~w~n", [Count]).
:- aggregate_all(sum(S), score(_, S), Total), format("sum: ~w~n", [Total]).
:- aggregate_all(max(S), score(_, S), Max), format("max: ~w~n", [Max]).
:- aggregate_all(bag(Name), score(Name, _), Names), format("bag: ~w~n", [Names]).
:- aggregate_all(set(S), score(_, S), UniqueScores), format("set: ~w~n", [UniqueScores]).
