-module(gray_code).
-export([to_gray/1, from_gray/1, run/0]).

to_gray(N) -> N bxor (N bsr 1).

from_gray(G) -> from_gray(G, 0).

from_gray(0, Acc) -> Acc;
from_gray(G, Acc) -> from_gray(G bsr 1, Acc bxor G).

run() ->
    lists:foreach(
      fun(I) ->
              G = to_gray(I),
              io:format("~p -> ~3..0B -> ~p~n", [I, list_to_integer(integer_to_list(G, 2)), from_gray(G)])
      end,
      lists:seq(0, 7)).
