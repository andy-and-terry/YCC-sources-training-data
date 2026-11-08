-module(varint_encode).
-export([main/0]).

varint(N) when N < 128 -> [N];
varint(N) -> [(N band 127) bor 128 | varint(N bsr 7)].

main() -> io:format("~p~n", [varint(300)]).
