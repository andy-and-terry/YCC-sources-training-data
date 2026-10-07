% Activity selection: greedily pick the next activity whose start is at
% or after the current finish time, from activities sorted by finish.
select_activities([], _, []).
select_activities([act(S, F, Name)|Rest], LastFinish, [Name|Selected]) :-
    S >= LastFinish, !,
    select_activities(Rest, F, Selected).
select_activities([_|Rest], LastFinish, Selected) :-
    select_activities(Rest, LastFinish, Selected).

activity_selection(Activities, Selected) :-
    sort(2, @=<, Activities, SortedByFinish),
    select_activities(SortedByFinish, 0, Selected).

:- Activities = [act(1, 4, a), act(3, 5, b), act(0, 6, c), act(5, 7, d), act(3, 9, e), act(5, 9, f), act(6, 10, g), act(8, 11, h)],
   activity_selection(Activities, Selected),
   writeln(Selected).
