% once/1, ignore/1, forall/2 and \+ control backtracking explicitly.
:- initialization(main).

color(red). color(green). color(blue).

main :-
    findall(C, color(C), All), format("all: ~w~n", [All]),
    once(color(First)), format("once: ~w~n", [First]),
    ( color(yellow) -> writeln(found) ; writeln("yellow not found") ),
    ignore(color(purple)), writeln("ignore never fails"),
    ( forall(color(C1), atom(C1)) -> writeln("all colours are atoms") ; true ),
    ( forall(color(C2), C2 \== blue) -> true ; writeln("forall failed: blue exists") ),
    ( \+ color(pink) -> writeln("no pink") ; true ),
    ( color(C3), C3 \== red, ! ; C3 = none ), format("first non-red: ~w~n", [C3]),
    aggregate_all(count, color(_), N), format("count: ~w~n", [N]),
    forall(nth1(I, [a, b, c], E), format("~w: ~w~n", [I, E])),
    ( between(1, inf, X), X * X > 50 -> format("first square above 50: ~w^2~n", [X]) ; true ),
    catch(call_with_depth_limit(deep(100), 50, R), _, R = error),
    format("depth limit result: ~w~n", [R]).

deep(0) :- !.
deep(N) :- N1 is N - 1, deep(N1).
