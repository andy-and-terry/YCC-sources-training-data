-module(invert_binary_tree).
-export([invert/1, inorder/1]).

invert(nil) -> nil;
invert({Value, Left, Right}) -> {Value, invert(Right), invert(Left)}.

inorder(nil) -> [];
inorder({Value, Left, Right}) -> inorder(Left) ++ [Value] ++ inorder(Right).
