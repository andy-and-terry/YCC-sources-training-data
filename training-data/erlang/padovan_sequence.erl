-module(padovan_sequence).
-export([main/0]).

%% Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
padovan(0, _) -> [];
padovan(N, {A, B, C}) -> [A | padovan(N - 1, {B, C, A + B})].

main() ->
    io:format("~p~n", [padovan(15, {1, 1, 1})]).
