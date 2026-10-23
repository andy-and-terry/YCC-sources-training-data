% sort/4: sort on an argument key, ascending/descending, with or without duplicates.

employee(alice, eng, 120).
employee(bob, ops, 90).
employee(carol, eng, 105).
employee(dave, ops, 90).
employee(erin, hr, 70).

show(Label, List) :-
    format("~w:~n", [Label]),
    forall(member(E, List), format("  ~w~n", [E])).

:- findall(employee(N, D, S), employee(N, D, S), Es),
   sort(3, @>=, Es, BySalaryDesc),
   show('salary desc (keeps ties)', BySalaryDesc).

:- findall(employee(N, D, S), employee(N, D, S), Es),
   sort(3, @>, Es, Unique),
   show('salary desc (drops equal keys)', Unique).

:- findall(employee(N, D, S), employee(N, D, S), Es),
   sort(2, @=<, Es, ByDept),
   show('by department, stable', ByDept).

% sorting plain lists
:- sort(0, @>=, [3, 1, 2, 3, 1], L), writeln(L).
:- sort(0, @=<, [c, a, b, a], L), writeln(L).
:- sort(0, @<, [c, a, b, a], L), writeln(L).

% key can be a pair key for sorting Key-Value lists
:- sort(1, @>=, [b-1, a-2, c-3], L), writeln(L).
:- sort(2, @=<, [b-3, a-2, c-1], L), writeln(L).
