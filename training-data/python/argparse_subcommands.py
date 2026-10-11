import argparse

parser = argparse.ArgumentParser(prog="tool")
parser.add_argument("-v", "--verbose", action="store_true")
sub = parser.add_subparsers(dest="cmd", required=True)

add = sub.add_parser("add", help="add numbers")
add.add_argument("nums", type=int, nargs="+")

greet = sub.add_parser("greet")
greet.add_argument("name")
greet.add_argument("--times", type=int, default=1)


def run(argv):
    ns = parser.parse_args(argv)
    if ns.cmd == "add":
        return sum(ns.nums)
    return " ".join([f"hi {ns.name}"] * ns.times)


print(run(["add", "1", "2", "3"]))
print(run(["-v", "greet", "Ann", "--times", "2"]))
