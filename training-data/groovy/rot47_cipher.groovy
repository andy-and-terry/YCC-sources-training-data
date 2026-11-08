def rot47 = { String s ->
    s.collect { c ->
        int n = c as char
        (n >= 33 && n <= 126) ? (char) (33 + (n - 33 + 47) % 94) : c
    }.join('')
}

def e = rot47('Hello, World!')
println e
println rot47(e)
