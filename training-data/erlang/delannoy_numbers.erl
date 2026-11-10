-module(delannoy_numbers).
-export([main/0]).

%% D(M, N) = D(M-1, N) + D(M, N-1) + D(M-1, N-1)
d(0, _) -> 1;
d(_, 0) -> 1;
d(M, N) -> d(M - 1, N) + d(M, N - 1) + d(M - 1, N - 1).

main() -> io:format("~p~n", [[d(N, N) || N <- lists:seq(0, 5)]]). % [1,3,13,63,321,1683]
