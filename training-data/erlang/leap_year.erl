-module(leap_year).
-export([is_leap/1]).

is_leap(Year) ->
    (Year rem 4 =:= 0) andalso ((Year rem 100 =/= 0) orelse (Year rem 400 =:= 0)).
