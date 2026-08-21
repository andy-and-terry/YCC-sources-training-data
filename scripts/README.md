# pull_training_data.py

Streams a size-capped, per-language sample of real source files from a
Hugging Face code corpus into `../training-data/<language>/`, instead of
vendoring the (multi-terabyte) dataset itself into this git repo.

## Why this exists

This repo's `training-data/` directory started as a small, hand-written
illustrative set. Growing it to a real training corpus by hand-authoring
files doesn't scale and produces low-diversity, repetitive content. The
right source is an existing, deduplicated, license-filtered code corpus —
but that data is far too large to commit directly to a git repository, and
this Claude session's sandbox has no network route to huggingface.co at
all (blocked by org egress policy). So: this script is meant to be run
*outside* that sandbox, by you, wherever you have network + (if needed) HF
auth, and it writes only a bounded sample.

## Setup

```bash
pip install -r requirements.txt
huggingface-cli login   # needed for gated datasets, e.g. bigcode/the-stack-v2*
```

## Run

```bash
python pull_training_data.py \
  --dataset bigcode/the-stack-v2-dedup \
  --languages python javascript typescript java go rust cpp ruby \
  --max-bytes-per-language 50000000 \
  --out-dir ../training-data
```

- `--max-bytes-per-language` caps how much this pulls per language (bytes).
  50 MB/language x 8 languages = ~400 MB total; raise it if you actually
  want GB-scale, but do so deliberately — see the note on repo storage
  below first.
- Each written file gets a `<file>.meta.json` sidecar recording its source
  repo, path, and license, since license provenance needs to survive for a
  permissively-licensed corpus like The Stack.

## About the dataset links from this conversation

- `bigcode/the-stack-v2-dedup`, `bigcode/the-stack-v2`, `bigcode/the-stack`,
  and `bigcode/starcoderdata` are real Hugging Face datasets. The dedup
  variant is the default here because deduplicated data trains better than
  raw, repetitive data.
- `HuggingFaceCode/stack-v3-train` and `huggingface.co/buckets/HuggingFaceCode/stack-v3-full`
  could not be verified — `huggingface.co/buckets/...` isn't a real HF URL
  pattern, and no such dataset/org was found. Double-check those
  independently before trusting them; this script does not use them.
- `the-stack-v2*` datasets are gated — you must accept their terms on the
  dataset page and be logged in via `huggingface-cli login` before
  streaming will work.

## A note on committing the output to git

Even a few hundred MB of vendored code files will noticeably bloat this
repository's history, and that's not easily reversible. Before committing
a large pull's output, consider whether it actually needs to live in this
git repo at all, versus being pulled on demand by whoever needs it (e.g.
CI, a training job) by just running this script.
