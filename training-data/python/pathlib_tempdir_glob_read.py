import tempfile
from pathlib import Path

with tempfile.TemporaryDirectory() as d:
    root = Path(d)
    (root / "a.txt").write_text("one\n")
    (root / "sub").mkdir()
    (root / "sub" / "b.txt").write_text("two\n")
    for p in sorted(root.rglob("*.txt")):
        print(p.relative_to(root), p.read_text().strip())
