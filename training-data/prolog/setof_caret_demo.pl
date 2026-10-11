sale(north, ann, 100).
sale(north, bob, 250).
sale(south, ann, 75).
sale(south, cy, 300).
sale(east, bob, 20).

% ^ existentially quantifies a variable so it does not partition the results.
:- setof(Region, Rep^Amount^sale(Region, Rep, Amount), Regions), writeln(Regions).

:- forall(setof(Rep-Amount, sale(Region, Rep, Amount), Rows),
          format("~w: ~w~n", [Region, Rows])).

:- setof(Amount, Region^sale(Region, ann, Amount), Amounts), writeln(Amounts).

:- ( setof(X, sale(nowhere, X, _), L) -> writeln(L) ; writeln('setof fails on empty') ).
:- bagof(X, sale(nowhere, X, _), L) -> true ; writeln('bagof fails too').
