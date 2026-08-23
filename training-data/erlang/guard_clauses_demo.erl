-module(guard_clauses_demo).
-export([classify/1]).

classify(N) when is_integer(N), N < 0 -> negative;
classify(0) -> zero;
classify(N) when is_integer(N), N rem 2 =:= 0 -> even;
classify(N) when is_integer(N) -> odd;
classify(_) -> not_a_number.
