-module(binary_tree_diameter).
-export([diameter/1]).

diameter(Tree) ->
    {Diam, _Height} = diameter_and_height(Tree),
    Diam.

diameter_and_height(nil) -> {0, 0};
diameter_and_height({_Value, Left, Right}) ->
    {LeftDiam, LeftHeight} = diameter_and_height(Left),
    {RightDiam, RightHeight} = diameter_and_height(Right),
    ThroughRoot = LeftHeight + RightHeight,
    Best = lists:max([LeftDiam, RightDiam, ThroughRoot]),
    {Best, max(LeftHeight, RightHeight) + 1}.
