"""pathlib together with tempfile: create, glob, read and clean up a
scratch directory tree without touching real files."""

import tempfile
from pathlib import Path


def build_tree(root: Path) -> None:
    (root / "src" / "pkg").mkdir(parents=True)
    (root / "src" / "main.py").write_text("print('hi')\n")
    (root / "src" / "pkg" / "util.py").write_text("X = 1\nY = 2\n")
    (root / "README.txt").write_text("readme")


def line_counts(root: Path) -> dict:
    return {
        str(p.relative_to(root)): len(p.read_text().splitlines())
        for p in sorted(root.rglob("*.py"))
    }


if __name__ == "__main__":
    with tempfile.TemporaryDirectory() as tmp:
        root = Path(tmp)
        build_tree(root)
        print(line_counts(root))
        p = root / "src" / "main.py"
        print(p.stem, p.suffix, p.parent.name)
        print(p.with_suffix(".txt").name)
    print("exists after cleanup:", root.exists())
