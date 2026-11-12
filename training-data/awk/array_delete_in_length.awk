BEGIN { a["x"]=1; a["y"]=2; a["z"]=3
        delete a["y"]
        print length(a), ("y" in a) ? "has y" : "no y"
        delete a; print length(a) }
