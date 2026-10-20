from pathlib import Path

if __name__ == "__main__":
    for p in sorted(Path(".").glob("*.py"))[:5]:
        print(p.name, p.suffix, p.stem)
