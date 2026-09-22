class Html {
    StringBuilder buffer = new StringBuilder()

    def tag(String name, Closure body) {
        buffer << "<${name}>"
        body.delegate = this
        body.resolveStrategy = Closure.DELEGATE_FIRST
        body()
        buffer << "</${name}>"
    }

    def text(String content) {
        buffer << content
    }

    String toString() {
        return buffer.toString()
    }
}

def html = new Html()
html.tag("div") {
    tag("h1") {
        text("Title")
    }
    tag("p") {
        text("Body text")
    }
}

println html
