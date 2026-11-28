let rec columnTitle n =
    if n = 0 then ""
    else columnTitle ((n - 1) / 26) + string (char (int 'A' + (n - 1) % 26))

printfn "%s %s" (columnTitle 28) (columnTitle 701) // AB ZY
