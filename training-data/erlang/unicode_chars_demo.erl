-module(unicode_chars_demo).
-export([main/0]).

main() ->
    Text = "héllo wörld",
    io:format("chars: ~p~n", [length(Text)]),
    Bin = unicode:characters_to_binary(Text),
    io:format("utf8 bytes: ~p~n", [byte_size(Bin)]),
    io:format("round trip: ~ts~n", [unicode:characters_to_list(Bin)]),
    io:format("codepoints: ~w~n", [string:slice(Text, 0, 3)]),
    io:format("upper: ~ts~n", [string:uppercase(Text)]),
    io:format("reverse: ~ts~n", [lists:reverse(Text)]),
    io:format("graphemes: ~p~n", [length(string:to_graphemes(Text))]),
    io:format("invalid: ~p~n", [element(1, unicode:characters_to_binary(<<255, 254>>))]),
    io:format("latin1: ~p~n", [unicode:characters_to_binary("é", utf8, latin1)]),
    io:format("tokens: ~p~n", [string:tokens("a b  c", " ")]),
    io:format("find: ~p~n", [string:find(Text, "wör")]).
