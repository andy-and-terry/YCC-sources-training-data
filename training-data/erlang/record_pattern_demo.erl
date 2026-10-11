-module(record_pattern_demo).
-export([run/0]).

-record(person, {name, age = 0, email = undefined}).

describe(#person{age = A}) when A < 18 -> minor;
describe(#person{name = N, age = A}) when A >= 65 -> {senior, N};
describe(#person{}) -> adult.

run() ->
    P1 = #person{name = "Ann", age = 12},
    P2 = #person{name = "Bob", age = 70},
    P3 = #person{name = "Cy", age = 30, email = "cy@example.com"},
    io:format("~p ~p ~p~n", [describe(P1), describe(P2), describe(P3)]),
    P4 = P3#person{age = 31},
    io:format("~p~n", [P4#person.age]),
    io:format("~p~n", [record_info(fields, person)]),
    io:format("~p~n", [P1#person.email]).
