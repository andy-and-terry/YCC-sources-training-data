BEGIN { s = "Hello World"
        print toupper(s), tolower(s), length(s), index(s, "World")
        printf "%c%c\n", 72, 105 }
