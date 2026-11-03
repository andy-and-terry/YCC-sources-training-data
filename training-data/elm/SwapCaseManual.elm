module SwapCaseManual exposing (swapCase)


swapCase : String -> String
swapCase =
    String.map
        (\c ->
            if Char.isUpper c then
                Char.toLower c

            else
                Char.toUpper c
        )
