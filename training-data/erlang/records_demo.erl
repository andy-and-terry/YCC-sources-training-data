-module(records_demo).
-export([new/0, birthday/1]).
-record(person, {name, age = 0}).

new() -> #person{name = "ann"}.
birthday(P = #person{age = A}) -> P#person{age = A + 1}.
