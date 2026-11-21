-module(keith_numbers).
-export([main/0]).

%% Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
is_keith(N) ->
    Digits = [C - $0 || C <- integer_to_list(N)],
    go(lists:reverse(Digits), length(Digits), N).

%% Seq is kept newest-first.
go([Last | _], _K, N) when Last >= N -> Last =:= N;
go(Seq, K, N) -> go([lists:sum(lists:sublist(Seq, K)) | Seq], K, N).

main() ->
    Found = [integer_to_list(N) || N <- lists:seq(10, 1199), is_keith(N)],
    io:format("~s~n", [string:join(Found, " ")]).
