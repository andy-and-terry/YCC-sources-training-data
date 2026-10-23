def codes = [b: '1', f: '1', p: '1', v: '1',
             c: '2', g: '2', j: '2', k: '2', q: '2', s: '2', x: '2', z: '2',
             d: '3', t: '3', l: '4', m: '5', n: '5', r: '6']

def soundex = { String word ->
    def w = word.toLowerCase()
    def out = new StringBuilder(w[0].toUpperCase())
    def last = codes[w[0]]
    w.drop(1).each { ch ->
        def code = codes[ch]
        if (code && code != last) out << code
        if (ch != 'h' && ch != 'w') last = code
    }
    (out.toString() + '000')[0..3]
}

['Robert', 'Rupert', 'Tymczak', 'Pfister', 'Honeyman'].each {
    println "$it -> ${soundex(it)}"
}
