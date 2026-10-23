# str.maketrans builds a code-point translation table; str.translate applies it
# in a single pass, which is faster than chained replace() calls.
table = str.maketrans("aeiou", "AEIOU")
print("education".translate(table))

# Three-argument form: third string lists characters to delete.
strip_digits = str.maketrans("", "", "0123456789")
print("a1b2c3".translate(strip_digits))

# Mapping a character to a string (or None to delete) via a dict.
escapes = str.maketrans({"<": "&lt;", ">": "&gt;", "&": "&amp;"})
print("<b>Tom & Jerry</b>".translate(escapes))

# ROT13 as a classic use of translate.
import string
rot13 = str.maketrans(
    string.ascii_lowercase, string.ascii_lowercase[13:] + string.ascii_lowercase[:13]
)
print("hello".translate(rot13))
