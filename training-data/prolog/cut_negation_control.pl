max(X, Y, X) :- X >= Y, !.
max(_, Y, Y).

classify(N, neg) :- N < 0, !.
classify(0, zero) :- !.
classify(_, pos).

member_once(X, L) :- memberchk(X, L).

not_member(X, L) :- \+ member(X, L).

first_sol(G) :- once(G).

ifte(X, R) :- ( X > 10 -> R = big ; X > 5 -> R = medium ; R = small ).

main :-
    max(3, 7, M1), max(9, 2, M2), format("~w ~w~n", [M1, M2]),
    findall(C, (member(N, [-5, 0, 7]), classify(N, C)), Cs), format("~w~n", [Cs]),
    ( member_once(b, [a, b, c]) -> writeln(found) ; writeln(missing) ),
    ( not_member(z, [a, b]) -> writeln(absent) ; writeln(present) ),
    first_sol(member(Z, [x, y])), format("~w~n", [Z]),
    maplist(ifte, [1, 7, 20], Rs), format("~w~n", [Rs]),
    forall(member(Q, [2, 4, 6]), 0 is Q mod 2), writeln(all_even),
    catch(call(undefined_pred_xyz), error(existence_error(_, _), _), writeln(no_such_pred)).
:- initialization(main).
