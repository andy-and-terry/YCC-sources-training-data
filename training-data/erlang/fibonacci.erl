-module(fibonacci).
-export([sequence/1]).

sequence(N) -> go(N, 0, 1, []).

go(0, _A, _B, Acc) -> lists:reverse(Acc);
go(N, A, B, Acc) -> go(N - 1, B, A + B, [A | Acc]).
