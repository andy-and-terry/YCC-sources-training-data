-module(named_fun_demo).
-export([run/0]).

run() ->
    Fact = fun F(0) -> 1;
               F(N) when N > 0 -> N * F(N - 1)
           end,
    io:format("~p~n", [Fact(10)]),
    Sum = fun Loop([], Acc) -> Acc;
              Loop([H | T], Acc) -> Loop(T, Acc + H)
          end,
    io:format("~p~n", [Sum([1, 2, 3, 4], 0)]),
    Countdown = fun CD(0) -> [0];
                    CD(N) -> [N | CD(N - 1)]
                end,
    io:format("~p~n", [Countdown(5)]).
