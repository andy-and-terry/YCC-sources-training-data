# Training Data — Sorted by Language

Sample source files organized by programming language for model training.

> **Note on scale:** This directory is a small, hand-authored illustrative
> set (dozens of files). It is not a substitute for a real training corpus —
> see the caveats below before relying on it for actual model training.

> **Depth pass:** Python, JavaScript, TypeScript, Java, Go, Rust, C++, and
> C# also have a few larger, more realistic examples beyond the basic
> algorithm/data-structure samples — e.g. Dijkstra's algorithm, an LRU
> cache, a generic repository pattern, a state machine, producer/consumer
> concurrency, a thread-safe counter, and RAII resource management. These
> are still small hand-written files, not real production code, so treat
> them the same way as everything else here per the caveats below.
>
> Going forward, depth passes are one language per batch. Python has an
> extra round covering decorators (retry/rate-limit/memoize), context
> managers, asyncio producer/consumer, a hand-rolled JSON parser, an
> argparse CLI with subcommands, and a realistic exception hierarchy.

| Language   | Files |
|------------|-------|
| Python     | `quicksort.py`, `linked_list.py`, `word_count.py`, `fibonacci_memo.py`, `binary_tree.py` |
| JavaScript | `quicksort.js`, `stack.js`, `debounce.js`, `merge_sort.js` |
| TypeScript | `binary_search.ts`, `lru_cache.ts`, `result.ts`, `queue.ts` |
| Java       | `QuickSort.java`, `BinaryTree.java`, `Fibonacci.java` |
| Go         | `quicksort.go`, `worker_pool.go`, `queue.go`, `binary_tree.go` |
| Rust       | `quicksort.rs`, `stack.rs`, `fibonacci.rs`, `binary_tree.rs` |
| C++        | `quicksort.cpp`, `linked_list.cpp`, `queue.cpp` |
| Ruby       | `quicksort.rb`, `stack.rb`, `fibonacci.rb` |
| C#         | `QuickSort.cs`, `Stack.cs`, `Queue.cs` |
| Swift      | `quicksort.swift`, `stack.swift`, `fibonacci.swift` |
| Kotlin     | `QuickSort.kt`, `BinarySearch.kt`, `Queue.kt` |
| PHP        | `quicksort.php`, `stack.php`, `fibonacci.php` |
| C          | `merge_sort.c`, `queue.c` |
| Scala      | `QuickSort.scala`, `Palindrome.scala` |
| Haskell    | `QuickSort.hs`, `Fibonacci.hs` |
| R          | `bubble_sort.R`, `word_freq.R` |
| Perl       | `word_count.pl`, `quicksort.pl` |
| Lua        | `stack.lua`, `quicksort.lua` |
| Elixir     | `quicksort.exs`, `stack.exs` |
| Dart       | `quicksort.dart`, `queue.dart` |
| Clojure    | `quicksort.clj`, `word_count.clj` |
| Bash       | `word_count.sh`, `backup.sh` |
| Julia      | `quicksort.jl`, `fibonacci.jl` |
| F#         | `quicksort.fsx`, `fibonacci.fsx` |
| Zig        | `quicksort.zig`, `stack.zig` |
| Objective-C| `Stack.m`, `QuickSort.m` |
| Groovy     | `QuickSort.groovy`, `WordCount.groovy` |
| OCaml      | `quicksort.ml`, `stack.ml` |
| Erlang     | `quicksort.erl`, `stack.erl` |
| Nim        | `quicksort.nim`, `stack.nim` |
| Crystal    | `quicksort.cr`, `stack.cr` |
| Racket     | `quicksort.rkt`, `fibonacci.rkt` |
| PowerShell | `QuickSort.ps1`, `WordCount.ps1` |
| Fortran    | `quicksort.f90` |
| MATLAB     | `quicksort.m`, `fibonacci.m` |
| Solidity   | `Counter.sol`, `SimpleStorage.sol` |

| COBOL      | `factorial.cob`, `word_count.cob` |
| Prolog     | `quicksort.pl`, `fibonacci.pl` |
| D          | `quicksort.d`, `stack.d` |
| Tcl        | `quicksort.tcl`, `word_count.tcl` |
| VBA        | `QuickSort.bas`, `WordCount.bas` |
| Pascal     | `quicksort.pas`, `stack.pas` |
| Ada        | `quicksort.adb` |
| Assembly (x86-64 NASM) | `sum.asm` |

| Scheme     | `quicksort.scm`, `fibonacci.scm` |
| Common Lisp | `quicksort.lisp`, `stack.lisp` |
| Smalltalk  | `QuickSort.st`, `Stack.st` |
| Forth      | `factorial.fs`, `is_prime.fs` |
| Awk        | `word_count.awk`, `sum_column.awk` |
| Elm        | `QuickSort.elm`, `IsPrime.elm` |
| PL/SQL     | `factorial.sql`, `is_prime.sql` |
| Apex       | `QuickSort.cls`, `Stack.cls` |

| VHDL       | `counter.vhd` |
| Verilog    | `counter.v`, `mux.v` |
| GDScript   | `quicksort.gd`, `stack.gd` |
| Vala       | `quicksort.vala`, `stack.vala` |
| WebAssembly (WAT) | `add.wat`, `factorial.wat` |
| Standard ML | `quicksort.sml`, `fibonacci.sml` |
| Nix        | `factorial.nix`, `is_prime.nix` |
| Vimscript  | `word_count.vim`, `is_prime.vim` |

Additional patterns added to existing languages: `hash_map` (TypeScript, C++, Go), `palindrome` (Java, C#, Kotlin, Swift, PHP), `is_prime` (Python, JavaScript, Ruby, Rust, Java, Go), `gcd` (TypeScript, C#, Kotlin, Swift, PHP, C), and `merge_sort` (C#, Kotlin, Swift, PHP, Ruby).

Each subdirectory groups files by language category (`cat`) for easy filtering during ingestion.

## Caveats for actual model training

- **This is not GB-scale, and shouldn't be grown to that scale by hand.**
  Reaching gigabytes of text this way means hundreds of thousands of files;
  authoring that many one at a time is impractical and mostly produces
  repetitive, low-diversity content.
- **Repetition hurts more than it helps.** Real code corpora (The Stack,
  CodeSearchNet, StarCoder's training set, etc.) explicitly deduplicate
  near-identical snippets, because training on many copies of the same
  trivial pattern encourages memorization over generalization.
- **For real training data, prefer:** an existing large, deduplicated,
  license-filtered code corpus, or a curated set of real-world repository
  code (with tests, docs, and project structure) at a realistic scale.
