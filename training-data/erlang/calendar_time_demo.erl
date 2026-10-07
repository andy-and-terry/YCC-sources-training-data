-module(calendar_time_demo).
-export([main/0]).

main() ->
    Date = {2024, 2, 27},
    io:format("valid: ~p~n", [calendar:valid_date(Date)]),
    io:format("leap year: ~p~n", [calendar:is_leap_year(2024)]),
    io:format("days in Feb: ~p~n", [calendar:last_day_of_the_month(2024, 2)]),
    io:format("day of week (1=Mon): ~p~n", [calendar:day_of_the_week(Date)]),
    Days = calendar:date_to_gregorian_days(Date),
    io:format("plus 3 days: ~p~n", [calendar:gregorian_days_to_date(Days + 3)]),
    Secs = calendar:datetime_to_gregorian_seconds({Date, {8, 30, 0}}),
    io:format("later: ~p~n", [calendar:gregorian_seconds_to_datetime(Secs + 7200)]),
    Epoch = calendar:datetime_to_gregorian_seconds({{1970, 1, 1}, {0, 0, 0}}),
    io:format("unix time: ~p~n", [Secs - Epoch]),
    io:format("ms: ~p~n", [is_integer(erlang:system_time(millisecond))]).
