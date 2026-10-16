-module(fizzbuzz).
-export([run/0, fb/1]).

fb(N) when N rem 15 =:= 0 -> "FizzBuzz";
fb(N) when N rem 3 =:= 0 -> "Fizz";
fb(N) when N rem 5 =:= 0 -> "Buzz";
fb(N) -> integer_to_list(N).

run() ->
    lists:foreach(fun(N) -> io:format("~s~n", [fb(N)]) end, lists:seq(1, 15)).
