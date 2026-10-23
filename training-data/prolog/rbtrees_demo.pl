:- use_module(library(rbtrees)).

% Red-black trees give O(log n) ordered key-value storage.
:- list_to_rbtree([carol-30, alice-25, bob-41], T0),
   rb_insert(T0, dave, 19, T1),
   rb_lookup(bob, V, T1), format("bob: ~w~n", [V]),
   rb_update(T1, alice, 26, T2),
   rb_keys(T2, Keys), writeln(Keys),
   rb_visit(T2, Pairs), writeln(Pairs),
   rb_size(T2, Size), format("size: ~d~n", [Size]).

% Missing keys fail rather than throw.
:- list_to_rbtree([a-1], T), ( rb_lookup(z, _, T) -> writeln(found) ; writeln(missing) ).

% min/max entries and deletion.
:- list_to_rbtree([5-five, 2-two, 9-nine], T),
   rb_min(T, Kmin, _), rb_max(T, Kmax, _),
   format("min ~w, max ~w~n", [Kmin, Kmax]),
   rb_delete(T, 5, T2), rb_keys(T2, K2), writeln(K2).

% Fold over all values in key order.
:- list_to_rbtree([1-10, 2-20, 3-30], T),
   rb_fold([_-V, A0, A]>>(A is A0 + V), T, 0, Sum), writeln(Sum).
