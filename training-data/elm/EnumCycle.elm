module EnumCycle exposing (Day(..), allDays, next, toString)


type Day
    = Mon
    | Tue
    | Wed
    | Thu
    | Fri


allDays : List Day
allDays =
    [ Mon, Tue, Wed, Thu, Fri ]


next : Day -> Day
next day =
    case day of
        Mon ->
            Tue

        Tue ->
            Wed

        Wed ->
            Thu

        Thu ->
            Fri

        Fri ->
            Mon


toString : Day -> String
toString day =
    case day of
        Mon ->
            "Monday"

        Tue ->
            "Tuesday"

        Wed ->
            "Wednesday"

        Thu ->
            "Thursday"

        Fri ->
            "Friday"
