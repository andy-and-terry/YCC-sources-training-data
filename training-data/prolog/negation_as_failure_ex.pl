bird(tweety). bird(pingu). penguin(pingu).
flies(X) :- bird(X), \+ penguin(X).

:- forall(bird(B), (flies(B) -> format("~w flies~n", [B]) ; format("~w walks~n", [B]))).
