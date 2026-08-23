-module(gcd_lcm).
-export([gcd/2, lcm/2]).

gcd(A, 0) -> abs(A);
gcd(A, B) -> gcd(B, A rem B).

lcm(A, B) -> abs(A * B) div gcd(A, B).
