-module(lazy_caterer).
-export([main/0]).

pieces(Cuts) -> (Cuts * Cuts + Cuts + 2) div 2.

main() -> io:format("~p~n", [[pieces(N) || N <- lists:seq(0, 9)]]). % [1,2,4,7,11,16,22,29,37,46]
