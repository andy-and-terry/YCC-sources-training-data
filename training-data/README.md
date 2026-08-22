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
>
> Python then got a large single-language batch (115 files total,
> syntax-checked with `py_compile`) covering classic algorithms and data
> structures in depth: sorting (bubble/insertion/selection/heap/counting/
> radix/bucket/shell), searching and string matching (KMP, Rabin-Karp,
> binary search variants), graph algorithms (Dijkstra, A*, Bellman-Ford,
> Floyd-Warshall, Kruskal/Prim MST, topological sort, union-find), DP
> (knapsack, coin change, LCS, LIS, edit distance, subset sum), classic
> data structures (trie, segment tree, Fenwick tree, skip list, LFU/LRU
> cache, disjoint set, doubly linked list, bloom filter), GoF design
> patterns (singleton, factory, builder, strategy, command, visitor,
> observer), and small ML/stats primitives (linear regression, k-means,
> perceptron, gradient descent). Even at this volume it's still small
> hand-written illustrative code, not a real corpus — see the caveats
> below.
>
> JavaScript got the same large-batch treatment (108 files total, all
> verified with `node --check`), covering the same breadth as the Python
> batch — sorting/searching, string matching, graph algorithms, DP,
> classic data structures, GoF patterns, and ML/stats primitives — plus a
> few JS-specific idioms: an LRU cache and binary tree class, a `throttle`
> helper alongside the existing `debounce`, a concurrency-limited promise
> pool, and a retrying `fetch` wrapper with exponential backoff.
>
> TypeScript got the same large-batch treatment too (106 files total, all
> individually type-checked in `--strict` mode). Same breadth as the
> Python/JS batches, properly typed with generics, interfaces, and enums
> throughout, plus TS-specific additions: discriminated unions with
> exhaustiveness checking, a `Result<T, E>` type with `map`/`flatMap`,
> and demos of utility types (`Partial`, `Pick`, `Readonly`) and mapped
> conditional types.
>
> Java got the same large-batch treatment (104 files total, all
> successfully compiled together with `javac` and spot-run). Same
> breadth as the earlier batches, one public class per file matching
> Java's filename convention, plus Java-specific idioms: an `LruCache`
> via `LinkedHashMap` access-order eviction, try-with-resources, Stream
> pipelines with `Collectors.groupingBy`, `Optional` chaining, records
> with compact constructors, a sealed interface with exhaustive `switch`
> pattern matching, and an `AtomicLong`-based thread-safe counter
> exercised across ten threads.
>
> Go got the same large-batch treatment (102 files total, all passing
> `go vet` cleanly with several spot-run via `go run`). Same breadth as
> the earlier batches — each file is its own `package main` with a
> `func main()`, runnable individually as the existing Go files already
> were (no `go.mod`, so `go build ./...` isn't meaningful here; `go run
> <file>.go` is the intended way to exercise any one of them). Plus
> Go-specific idioms: a fan-out/fan-in channel pipeline, `errors.Is`/
> `errors.As` with a wrapped sentinel and a custom error type, a
> generic `Stack[T]` with a generic `Map` function, `defer`/`panic`/
> `recover`, `context.WithTimeout` cancellation, an `sync.RWMutex`
> cache exercised across ten goroutines, `encoding/json` struct tags,
> a hand-rolled binary heap, and the functional-options pattern.
>
> Rust got the same large-batch treatment (100 files total, each
> individually compiled with `rustc --edition 2021` — zero errors, only
> two harmless "field/variant never used" warnings in demo-only structs,
> fixed one real lint). Several spot-run to verify output. Same breadth
> as the earlier batches, written with real ownership/borrowing rather
> than clone-everywhere, plus Rust-specific idioms: `Result`/`?`
> error propagation with a custom error enum implementing `Display` and
> `std::error::Error`, `Rc<RefCell<>>` for a shared-ownership graph,
> trait objects and default trait methods, iterator adapter chains
> (`filter`/`map`/`partition`/`windows`), generic functions with trait
> bounds, pattern matching over enums with struct variants and guards,
> closures returned via `impl Fn`/`impl FnMut`, explicit lifetimes,
> the newtype pattern with `From`/`Add`, and `mpsc` channels with
> `thread::spawn`.
>
> C++ got the same large-batch treatment (100 files total: 98 `.cpp` +
> 2 `.hpp`, all compiled cleanly with `g++ -std=c++17 -pthread`; fixed
> one real missing-include bug found during the sweep). Nine spot-run
> to verify output. Same breadth as the earlier batches, plus
> C++-specific idioms: `std::variant`/`std::visit` with `if constexpr`,
> `std::optional` chaining, hand-written move semantics (move
> constructor/assignment, `noexcept`, deleted copy), operator
> overloading, class templates with a generic `Stack<T>` and a
> generic `mapVector`, STL algorithm chains (`sort`/`accumulate`/
> `transform`/`count_if`), `constexpr` compile-time evaluation with
> `static_assert`, `std::atomic` with `std::thread`, an LRU cache built
> on `std::list`/`std::unordered_map` splicing, a `std::runtime_error`
> exception hierarchy, `std::string_view`, and namespace organization.
>
> C# got the same large-batch treatment (100 files total) but with a
> real caveat: **this sandbox has no C# compiler.** `apt`'s
> `dotnet-sdk-8.0` package is stale (its dependencies 404), and
> Microsoft's install script is blocked by this session's network
> policy — installing one wasn't possible here. So unlike every other
> language in this depth pass, these files are **not compiler-verified**,
> only checked for balanced braces/parens/brackets (99/100 clean; the
> 100th, `ValidParentheses.cs`, "fails" only because its own string
> literals contain unbalanced bracket characters as test data — the
> code itself is fine). Treat this batch with more skepticism than the
> others until someone runs `dotnet build` on it. Same breadth as the
> earlier batches, plus C#-specific idioms: LINQ (`GroupBy`/`Select`/
> `Where`/`Sum`), `async`/`await` with retry-by-exception-filter,
> pattern-matching `switch` expressions over `record` hierarchies,
> `record ... with` non-destructive mutation, extension methods,
> `IDisposable`/`using`, generic constraints (`where T : IIdentifiable`),
> nullable reference types, indexers, `yield return` iterators, C#
> events/delegates, and `Span<T>`.
>
> That covers the 8 "main" languages. For the rest (everything below
> beyond a handful of samples), the target is 50 files each rather than
> ~100–115 — still real depth, just scoped smaller since these are
> breadth languages, not flagship ones. Ruby went first: 50 files
> total, all passing `ruby -c` syntax checks, several spot-run to
> verify output. Covers sorting/searching, graph algorithms
> (union-find, topological sort), DP (knapsack, coin change, edit
> distance, LCS), a trie, and a batch of idiomatic Ruby: modules/mixins
> (`Comparable`, `Enumerable`, `Singleton`), blocks/procs/lambdas,
> `method_missing`, refinements, pattern matching (`case/in`), keyword
> arguments, frozen/immutable objects, a custom lazy `Enumerator`, and
> `Mutex`-synchronized threads.
>
> PHP went next: 50 files total, all passing `php -l` syntax checks, and
> a broad set spot-run with the `php` CLI to confirm correct output.
> Covers sorting/searching (quicksort, linear search, KMP string
> matching), graph/DP staples (union-find, topological sort, Dijkstra,
> 0/1 knapsack, coin change, edit distance, LCS), data structures
> (binary tree, trie, linked list, binary min-heap, LRU cache), and
> modern PHP idioms: traits, generators (`yield`), closures with `use
> (&$var)`, first-class callable syntax (`func(...)`), readonly
> properties, backed enums (`enum ... : string`) with `match`,
> interfaces/polymorphism, the `match` expression (including `match
> (true)` range dispatch), exception hierarchies, static properties,
> and `preg_*` regex helpers.
>
> Starting with Swift, the breadth-language target was lowered further
> to 25 files each (still real depth, just proportioned for languages
> that aren't the flagship set). Swift: 25 files total. No Swift
> compiler/toolchain is available in this sandbox, so — like the C#
> batch — these are not compiler-verified; treat this batch with the
> same added skepticism until someone runs them through `swiftc`.
> Covers sorting/searching, a linked list and binary tree, union-find,
> 0/1 knapsack, edit distance, two-sum, and valid-parentheses, plus
> idiomatic Swift: protocols with default implementations via
> `extension`, optional chaining, enums with associated values,
> closures (including an escaping counter closure), a generic `Stack<Element>`,
> `Error`-conforming enums with `do`/`try`/`catch`, a singleton via
> `static let shared` with a private initializer, and a struct-vs-class
> value/reference semantics comparison.
>
> After Swift, the breadth-language target was lowered again, to 10
> files per language going forward (existing larger batches are kept,
> not trimmed). Kotlin landed at 12 files (6 pre-existing + 6 new:
> bubble/insertion/selection sort, a linked list, a binary tree, and
> two-sum) before this new floor took effect. No Kotlin
> compiler/toolchain is available in this sandbox, so — like Swift and
> C# — this batch is not compiler-verified.
>
> Scala: 10 files total (2 pre-existing + 8 new), landing exactly at
> the new 10-file floor. Covers sorting/searching (bubble sort, merge
> sort via pattern-matched list recursion, binary search), Fibonacci
> with a `@tailrec` accumulator, and idiomatic Scala: `sealed trait` +
> `case class` pattern matching over shapes, `Option`/`Some`/`None` for
> safe division and `flatten`, higher-order functions (`map`/`filter`/
> `foldLeft`, function composition), and a `trait` mixin (`with`) demo.
> No Scala toolchain is available in this sandbox, so this batch is not
> compiler-verified.
>
> The breadth-language floor was lowered once more, to 5 files per
> language. Haskell landed at 6 files (2 pre-existing + 4 new: bubble
> sort, merge sort, a `Data.Array`-based binary search, and a `Maybe`-
> based safe-division demo with a list comprehension over
> `Just`/`Nothing`) before this floor took effect. No GHC toolchain is
> available in this sandbox, so this batch is not compiler-verified.
>
> With the floor now at 5 files, remaining under-target languages are
> being topped up one at a time. Ada: 5 files (1 pre-existing + 4 new:
> Fibonacci, primality test, GCD via Euclid's algorithm, and a
> recursive factorial using `Long_Long_Integer`). No Ada toolchain
> (`gnatmake`/`gcc -c -gnat`) is available in this sandbox, so this
> batch is not compiler-verified.
>
> Assembly (x86-64 NASM): 5 files (1 pre-existing + 4 new: iterative
> factorial, max-of-array scan, iterative Fibonacci, and in-place
> string reversal via a two-pointer swap loop), all following the
> existing `_start`/`syscall exit` convention. No NASM/`ld` toolchain
> is available in this sandbox, so this batch is not assembled or
> run-verified.
>
> Fortran (free-form `.f90`): 5 files (1 pre-existing + 4 new:
> Fibonacci, a primality test, GCD via a recursive `contains` function,
> and bubble sort). No `gfortran` toolchain is available in this
> sandbox, so this batch is not compiler-verified.
>
> VHDL: 5 files (1 pre-existing + 4 new: a D flip-flop, a 4-to-1
> multiplexer, a combinational full adder, and a 4-bit shift register),
> all standard synchronous/combinational digital-logic patterns. No
> VHDL toolchain (e.g. GHDL) is available in this sandbox, so this
> batch is not simulated or elaboration-verified.
>
> Apex: 5 files (2 pre-existing + 3 new: Fibonacci, binary search, and
> a linked-list reversal), plus a Salesforce-idiomatic
> `AccountTriggerHandler` class showing the before/after-insert trigger
> handler pattern over `List<Account>`/`Set<Id>`. No Apex toolchain
> (Salesforce org/CLI) is available in this sandbox, so this batch is
> not compiler-verified.
>
> Awk: 5 files (2 pre-existing + 3 new: column average, CSV-to-TSV
> conversion via `FS`/`OFS`, and a duplicate-line detector). Unlike
> most of the recent breadth top-ups, `awk` *is* available in this
> sandbox — all 5 files were run against sample input and produced
> correct output.
>
> Bash: 5 files (2 pre-existing + 3 new: bubble sort, a primality
> test, and a retry-with-exponential-backoff helper that wraps an
> arbitrary command). `bash` is available in this sandbox — all 3 new
> scripts were executed directly and produced correct output.
>
> Clojure: 5 files (2 pre-existing + 3 new: a lazy Fibonacci sequence
> via `iterate`, a primality filter, and an `atom`-based counter using
> `swap!`). No Clojure/JVM toolchain is available in this sandbox, so
> this batch is not run-verified.

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
