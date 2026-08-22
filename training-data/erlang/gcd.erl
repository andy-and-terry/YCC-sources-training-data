-module(gcd).
-export([compute/2]).

compute(A, 0) -> A;
compute(A, B) -> compute(B, A rem B).
