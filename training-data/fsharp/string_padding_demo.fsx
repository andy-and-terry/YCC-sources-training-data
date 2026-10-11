let rows = [ "apple", 3, 1.5; "kiwi", 12, 0.25; "watermelon", 1, 4.0 ]

printfn "%s|%s|%s" ("Item".PadRight 12) ("Qty".PadLeft 5) ("Price".PadLeft 8)
printfn "%s" (String.replicate 27 "-")

for (name, qty, price) in rows do
    printfn "%s|%s|%s" (name.PadRight 12) ((string qty).PadLeft 5) ((sprintf "%.2f" price).PadLeft 8)

// format specifiers with width
for (name, qty, price) in rows do
    printfn "%-12s|%5d|%8.2f" name qty price

printfn "%s" ("7".PadLeft(3, '0'))
printfn "%s" ("ab".PadRight(5, '.') + "|")
