"""A small argparse-based CLI with subcommands, for demonstrating a
realistic command-line tool structure."""

import argparse
import sys
from pathlib import Path


def cmd_count(args: argparse.Namespace) -> int:
    path = Path(args.file)
    if not path.exists():
        print(f"error: {path} does not exist", file=sys.stderr)
        return 1
    text = path.read_text()
    lines = text.splitlines()
    words = text.split()
    print(f"lines: {len(lines)}")
    print(f"words: {len(words)}")
    print(f"chars: {len(text)}")
    return 0


def cmd_grep(args: argparse.Namespace) -> int:
    path = Path(args.file)
    if not path.exists():
        print(f"error: {path} does not exist", file=sys.stderr)
        return 1
    matches = 0
    for lineno, line in enumerate(path.read_text().splitlines(), start=1):
        needle = line if args.ignore_case is False else line.lower()
        pattern = args.pattern if args.ignore_case is False else args.pattern.lower()
        if pattern in needle:
            matches += 1
            print(f"{lineno}: {line}")
    return 0 if matches > 0 else 1


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(prog="texttool", description="Small text utility CLI")
    subparsers = parser.add_subparsers(dest="command", required=True)

    count_parser = subparsers.add_parser("count", help="count lines/words/chars in a file")
    count_parser.add_argument("file")
    count_parser.set_defaults(func=cmd_count)

    grep_parser = subparsers.add_parser("grep", help="find lines matching a substring")
    grep_parser.add_argument("pattern")
    grep_parser.add_argument("file")
    grep_parser.add_argument("-i", "--ignore-case", action="store_true")
    grep_parser.set_defaults(func=cmd_grep)

    return parser


def main(argv=None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
