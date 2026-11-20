-module(dedupe_adjacent).
-export([main/0]).
%% Remove consecutive duplicates with pattern matching.
dedupe([X, X | T]) -> dedupe([X | T]);
dedupe([H | T]) -> [H | dedupe(T)];
dedupe([]) -> [].
main() -> io:format("~s~n", [dedupe("aabbbcdd")]).
