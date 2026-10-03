#!/usr/bin/env bash
set -euo pipefail

# xargs turns a stream of lines into arguments for another command,
# here batching them two at a time.
printf '1\n2\n3\n4\n5\n6\n' | xargs -n 2 echo "pair:"
