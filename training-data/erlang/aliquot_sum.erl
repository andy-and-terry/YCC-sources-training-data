-module(aliquot_sum).
-export([main/0]).
%% Aliquot sum classification.
aliquot(N) -> lists:sum([D || D <- lists:seq(1, N - 1), N rem D =:= 0]).
kind(N, A) when A =:= N -> perfect;
kind(N, A) when A > N -> abundant;
kind(_, _) -> deficient.
main() -> [io:format("~p ~p ~p~n", [N, aliquot(N), kind(N, aliquot(N))]) || N <- [6, 12, 15, 28]], ok.
