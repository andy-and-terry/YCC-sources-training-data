import fnmatch
import re


def filter_names(names, pattern):
    return fnmatch.filter(names, pattern)


if __name__ == "__main__":
    files = ["a.py", "b.txt", "test_a.py", "Test_B.PY", "data.csv"]
    print(filter_names(files, "*.py"))
    print(fnmatch.fnmatchcase("Test_B.PY", "*.py"))
    print(fnmatch.fnmatch("x1", "x[0-9]"), fnmatch.fnmatch("xa", "x[!0-9]"))
    regex = re.compile(fnmatch.translate("test_*.py"))
    print(bool(regex.match("test_a.py")))
