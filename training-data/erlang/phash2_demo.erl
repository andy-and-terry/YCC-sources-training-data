-module(phash2_demo).
-export([run/0, bucket/2]).

%% Map any term to one of N buckets using erlang:phash2/2.
bucket(Term, N) -> erlang:phash2(Term, N).

run() ->
    Keys = [apple, banana, cherry, {point, 1, 2}, "text", 42],
    lists:foreach(
      fun(K) ->
              B = bucket(K, 8),
              true = B >= 0 andalso B < 8,
              io:format("~p -> in range~n", [K])
      end, Keys),
    true = bucket(apple, 100) =:= bucket(apple, 100),
    io:format("deterministic: ~p~n", [bucket(apple, 100) =:= bucket(apple, 100)]).
