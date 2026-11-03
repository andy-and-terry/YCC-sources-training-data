-module(vowel_counter).
-export([main/0, count_vowels/1]).

count_vowels(S) ->
    Lower = string:lowercase(S),
    [{V, length([C || C <- Lower, C =:= V])} || V <- "aeiou"].

main() -> io:format("~p~n", [count_vowels("Education is beautiful")]).
