def encode(String s) {
    s.findAll(/(.)\1*/) { m, ch -> "${m.size()}$ch" }.join()
}

def decode(String s) {
    s.replaceAll(/(\d+)(\D)/) { all, n, ch -> ch * (n as int) }
}

def text = 'WWWWWWBBBWWCDDDDD'
def enc = encode(text)
println enc
println decode(enc)
assert decode(enc) == text
