-module(moser_de_bruijn).
-export([main/0]).

%% Read the binary digits of I as base-4 digits.
moser(0) -> 0;
moser(I) -> (I rem 2) + 4 * moser(I div 2).

main() -> io:format("~p~n", [[moser(I) || I <- lists:seq(0, 9)]]). % [0,1,4,5,16,17,20,21,64,65]
