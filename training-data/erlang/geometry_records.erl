-module(geometry_records).
-export([area/1]).

-record(circle, {radius}).
-record(rectangle, {width, height}).
-record(triangle, {base, height}).

%% Function clauses pattern-match directly on the record's tag and
%% fields, so each shape's area formula lives in its own clause and
%% dispatch happens for free -- no explicit type tag or case needed.

area(#circle{radius = R}) -> math:pi() * R * R;
area(#rectangle{width = W, height = H}) -> W * H;
area(#triangle{base = B, height = H}) -> 0.5 * B * H.

run() ->
    Shapes = [#circle{radius = 2}, #rectangle{width = 3, height = 4}, #triangle{base = 6, height = 5}],
    io:format("~p~n", [[area(Shape) || Shape <- Shapes]]).
