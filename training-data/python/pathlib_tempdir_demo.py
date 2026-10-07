import tempfile
from pathlib import Path

with tempfile.TemporaryDirectory() as tmp:
    root = Path(tmp)
    (root / "src").mkdir()
    (root / "src" / "a.txt").write_text("hello\nworld\n")
    (root / "src" / "b.md").write_text("# title")

    for p in sorted(root.rglob("*")):
        print(p.relative_to(root), "dir" if p.is_dir() else p.stat().st_size)

    f = root / "src" / "a.txt"
    print(f.suffix, f.stem, f.parent.name)
    print(f.read_text().splitlines())
    print([p.name for p in root.glob("src/*.md")])
    f.rename(f.with_suffix(".bak"))
    print(sorted(p.name for p in (root / "src").iterdir()))
