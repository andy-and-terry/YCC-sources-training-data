#!/usr/bin/env python3
"""Stream a sample of real source files from a Hugging Face code corpus,
sorted into per-language folders under training-data/.

This script is NOT run inside the Claude session that authored it — this
sandbox's network policy blocks huggingface.co entirely. Run it yourself,
somewhere with network access and (for gated datasets) an accepted-terms HF
token.

Why streaming + sampling instead of a full download:
  - bigcode/the-stack-v2-dedup is on the order of several TB; the-stack (v1)
    is a few TB; starcoderdata is ~700GB. None of that belongs in a git repo.
  - `datasets` streaming mode reads records on the fly without materializing
    the whole dataset, so you can cap output at a specific number of bytes.
  - Deduplication matters: the *-dedup variants already drop near-identical
    files, which is what you want for training signal, not repetition.

Two of the URLs shared in this conversation --
  https://huggingface.co/datasets/HuggingFaceCode/stack-v3-train
  https://huggingface.co/buckets/HuggingFaceCode/stack-v3-full
-- do not match any dataset or URL pattern on Hugging Face I can confirm.
"huggingface.co/buckets/..." is not a real HF URL scheme. Verify those
independently before use; this script defaults to a well-known, real
dataset instead (bigcode/the-stack-v2-dedup).

Usage:
    pip install -r requirements.txt
    huggingface-cli login   # required for gated datasets like the-stack-v2*
    python pull_training_data.py \
        --dataset bigcode/the-stack-v2-dedup \
        --languages python javascript go rust \
        --max-bytes-per-language 50000000 \
        --out-dir ../training-data

Each dataset examples' file content is written out as-is, with the file's
license and repo path recorded in a sidecar `<file>.meta.json` so license
provenance survives (required for permissively-licensed-only corpora like
The Stack).
"""

import argparse
import json
import re
from pathlib import Path

from datasets import load_dataset

# bigcode datasets use these subset/config names for "by programming language"
# streaming access. Adjust if the dataset you pick uses a different scheme.
DEFAULT_DATASET = "bigcode/the-stack-v2-dedup"


def sanitize_filename(path: str) -> str:
    name = re.sub(r"[^A-Za-z0-9._-]", "_", path)
    return name[-150:] or "file"


def pull_language(dataset_name: str, language: str, max_bytes: int, out_dir: Path) -> int:
    lang_dir = out_dir / language.lower()
    lang_dir.mkdir(parents=True, exist_ok=True)

    ds = load_dataset(dataset_name, data_dir=f"data/{language}", split="train", streaming=True)

    written_bytes = 0
    count = 0
    for example in ds:
        content = example.get("content")
        if not content:
            continue
        encoded = content.encode("utf-8", errors="ignore")
        if written_bytes + len(encoded) > max_bytes:
            break

        repo_path = example.get("path") or example.get("max_stars_repo_path") or f"file_{count}"
        filename = sanitize_filename(repo_path)
        dest = lang_dir / filename
        if dest.exists():
            dest = lang_dir / f"{count}_{filename}"

        dest.write_bytes(encoded)
        meta = {
            "source_dataset": dataset_name,
            "repo": example.get("max_stars_repo_name") or example.get("repository_name"),
            "path": repo_path,
            "license": example.get("max_stars_repo_licenses") or example.get("license"),
        }
        dest.with_suffix(dest.suffix + ".meta.json").write_text(json.dumps(meta, indent=2))

        written_bytes += len(encoded)
        count += 1

    print(f"[{language}] wrote {count} files, {written_bytes / 1e6:.1f} MB")
    return written_bytes


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--dataset", default=DEFAULT_DATASET, help="HF dataset repo id")
    parser.add_argument("--languages", nargs="+", required=True, help="Language subset names, e.g. python go rust")
    parser.add_argument("--max-bytes-per-language", type=int, default=50_000_000, help="Cap per language (bytes)")
    parser.add_argument("--out-dir", type=Path, default=Path("../training-data"), help="Output root directory")
    args = parser.parse_args()

    args.out_dir.mkdir(parents=True, exist_ok=True)
    total = 0
    for language in args.languages:
        total += pull_language(args.dataset, language, args.max_bytes_per_language, args.out_dir)
    print(f"Total: {total / 1e6:.1f} MB across {len(args.languages)} language(s)")


if __name__ == "__main__":
    main()
