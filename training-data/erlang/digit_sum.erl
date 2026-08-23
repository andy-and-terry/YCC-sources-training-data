-module(digit_sum).
-export([sum/1]).

sum(N) when N < 10 -> N;
sum(N) -> N rem 10 + sum(N div 10).
