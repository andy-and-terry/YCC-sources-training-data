module StringSplitJoinDemo exposing (csvRow, slugify, words)


words : String -> List String
words text =
    String.words text


csvRow : String -> List String
csvRow line =
    line
        |> String.split ","
        |> List.map String.trim


slugify : String -> String
slugify title =
    title
        |> String.toLower
        |> String.words
        |> String.join "-"



-- csvRow "a, b ,c" == [ "a", "b", "c" ]
-- slugify "Hello Big World" == "hello-big-world"
