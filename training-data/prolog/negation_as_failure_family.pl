parent(tom, bob). parent(tom, liz). parent(bob, ann).

childless(P) :- \+ parent(P, _), (parent(_, P) ; true).

:- forall(member(X, [tom, bob, ann]), (childless(X) -> format("~w childless~n", [X]) ; format("~w has kids~n", [X]))).
