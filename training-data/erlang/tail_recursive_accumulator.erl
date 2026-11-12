-module(tail_rec).
-export([main/0]).
rev(L) -> rev(L, []).
rev([], A) -> A;
rev([H | T], A) -> rev(T, [H | A]).
main() -> io:format("~p~n", [rev([1, 2, 3, 4])]).
