foreach v {apple 42 zzz} {
    switch -regexp -- $v {
        {^\d+$} { puts "$v: number" }
        {^a}    { puts "$v: starts with a" }
        default { puts "$v: other" }
    }
}
