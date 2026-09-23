module TemplateMethodPattern exposing (Report, plainTextReport, renderReport)

{-| The Gang-of-Four Template Method pattern fixes an algorithm's skeleton
while letting subclasses override specific steps. Elm has no inheritance, so
the "skeleton" becomes a single function that takes the varying steps as
arguments (a record of functions), and callers supply their own "override"
for each step.
-}


type alias Report =
    { header : () -> String
    , body : List Int -> String
    , footer : () -> String
    }


renderReport : Report -> List Int -> String
renderReport report numbers =
    report.header () ++ "\n" ++ report.body numbers ++ "\n" ++ report.footer ()


plainTextReport : Report
plainTextReport =
    { header = \_ -> "=== Report ==="
    , body = \numbers -> "total: " ++ String.fromInt (List.sum numbers)
    , footer = \_ -> "=== End ==="
    }
