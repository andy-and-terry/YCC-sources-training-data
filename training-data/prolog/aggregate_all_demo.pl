% aggregate_all/3: single-pass count/sum/bag/set/max aggregation over a
% goal's solutions, more direct than post-processing findall/3's results.
score(alice, 90).
score(bob, 72).
score(carol, 88).
score(dave, 72).

:- aggregate_all(count, score(_, _), Count), writeln(Count).
:- aggregate_all(sum(S), score(_, S), Total), writeln(Total).
:- aggregate_all(max(S), score(_, S), Best), writeln(Best).
:- aggregate_all(bag(Name), score(Name, _), Names), writeln(Names).
:- aggregate_all(set(S), score(_, S), UniqueScores), writeln(UniqueScores).
