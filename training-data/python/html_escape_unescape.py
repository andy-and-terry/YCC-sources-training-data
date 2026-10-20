import html
from html.parser import HTMLParser


class LinkCollector(HTMLParser):
    def __init__(self):
        super().__init__()
        self.links = []

    def handle_starttag(self, tag, attrs):
        if tag == "a":
            self.links.append(dict(attrs).get("href"))


if __name__ == "__main__":
    raw = '<a href="x?a=1&b=2">"hi" & bye</a>'
    esc = html.escape(raw)
    print(esc)
    assert html.unescape(esc) == raw
    print(html.unescape("&lt;b&gt; &amp; &#169; &eacute;"))
    p = LinkCollector()
    p.feed('<p><a href="/one">1</a> <a href="/two">2</a></p>')
    print(p.links)
