"""Demonstrates pathlib for filesystem paths: joining, globbing, and reading/writing text."""

import tempfile
from pathlib import Path


def build_project_tree(root: Path) -> None:
    (root / "src").mkdir(parents=True, exist_ok=True)
    (root / "docs").mkdir(parents=True, exist_ok=True)
    (root / "src" / "main.py").write_text("print('hello')\n")
    (root / "src" / "utils.py").write_text("def helper(): pass\n")
    (root / "docs" / "README.md").write_text("# Project\n")


def list_python_files(root: Path) -> list[str]:
    return sorted(str(p.relative_to(root)) for p in root.rglob("*.py"))


def describe(path: Path) -> str:
    return f"{path.name}: suffix={path.suffix!r}, parent={path.parent.name!r}"


if __name__ == "__main__":
    with tempfile.TemporaryDirectory() as tmp:
        root = Path(tmp)
        build_project_tree(root)
        py_files = list_python_files(root)
        print(py_files)
        for py_file in py_files:
            print(describe(root / py_file))
