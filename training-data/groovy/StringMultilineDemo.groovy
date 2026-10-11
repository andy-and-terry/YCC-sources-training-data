def name = "Groovy"
def text = """\
Hello, ${name}!
  Indented line
Total: ${1 + 2}
"""
println text
def raw = '''single
quoted ${not interpolated}'''
println raw
def slashy = /C:\path\to\file/
println slashy
def dollar = $/it's "quoted" and $name/$
println dollar
println text.readLines().size()
println text.stripIndent()
