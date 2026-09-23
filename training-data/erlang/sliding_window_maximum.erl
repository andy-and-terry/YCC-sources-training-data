-module(sliding_window_maximum).
-export([max_window/2]).

%% For each window of size K sliding across List, keeps the maximum
%% element -- one sublist and one max per window position.

max_window(List, K) ->
    N = length(List),
    [lists:max(lists:sublist(List, I, K)) || I <- lists:seq(1, N - K + 1)].

run() ->
    io:format("~p~n", [max_window([1, 3, -1, -3, 5, 3, 6, 7], 3)]).
