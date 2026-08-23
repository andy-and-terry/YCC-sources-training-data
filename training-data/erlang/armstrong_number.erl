-module(armstrong_number).
-export([is_armstrong/1]).

digits(N) when N < 10 -> [N];
digits(N) -> digits(N div 10) ++ [N rem 10].

is_armstrong(N) ->
    Digits = digits(N),
    Power = length(Digits),
    Sum = lists:sum([round(math:pow(D, Power)) || D <- Digits]),
    Sum =:= N.
