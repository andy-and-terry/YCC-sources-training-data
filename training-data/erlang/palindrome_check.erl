-module(palindrome_check).
-export([is_palindrome/1]).

is_palindrome(Str) ->
    Normalized = [C || C <- string:to_lower(Str), C >= $a, C =< $z orelse (C >= $0 andalso C =< $9)],
    Normalized =:= lists:reverse(Normalized).
