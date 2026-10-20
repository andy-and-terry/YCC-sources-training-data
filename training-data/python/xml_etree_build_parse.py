import xml.etree.ElementTree as ET

DOC = """<library>
  <book id="1"><title>Dune</title><year>1965</year></book>
  <book id="2"><title>Emma</title><year>1815</year></book>
</library>"""


if __name__ == "__main__":
    root = ET.fromstring(DOC)
    for book in root.findall("book"):
        print(book.get("id"), book.findtext("title"), int(book.findtext("year")))
    print([t.text for t in root.iter("title")])
    print(root.find(".//book[@id='2']/title").text)

    new = ET.SubElement(root, "book", id="3")
    ET.SubElement(new, "title").text = "Ulysses"
    ET.indent(root)
    print(ET.tostring(root, encoding="unicode"))
