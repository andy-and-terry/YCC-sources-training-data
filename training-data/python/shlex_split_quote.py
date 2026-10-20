import shlex


def parse_command(line):
    return shlex.split(line)


def build_command(args):
    return " ".join(shlex.quote(a) for a in args)


if __name__ == "__main__":
    print(parse_command('git commit -m "fix: handle empty input" --amend'))
    print(build_command(["echo", "hello world", "it's", "$HOME"]))
    # Round trip is lossless.
    args = ["a b", "c'd", '"e"']
    assert parse_command(build_command(args)) == args
