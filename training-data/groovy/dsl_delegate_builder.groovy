class Html {
    StringBuilder sb = new StringBuilder()
    def tag(String n, Closure c) { sb << "<$n>"; c.delegate = this; c(); sb << "</$n>" }
    def text(String s) { sb << s }
}
def h = new Html()
h.tag('p') { text('hi') }
println h.sb
