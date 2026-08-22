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
>
> COBOL: 5 files (2 pre-existing + 3 new: Fibonacci, a primality test,
> and GCD via Euclid's algorithm, all in fixed-format COBOL with
> `PERFORM VARYING`/`PERFORM UNTIL`). No `cobc` (GnuCOBOL) toolchain is
> available in this sandbox, so this batch is not compiler-verified.
>
> Common Lisp: 5 files (2 pre-existing + 3 new: an iterative Fibonacci
> using `loop`/`psetf`, a primality filter, and a recursive binary
> search over a vector). No CL toolchain (SBCL/CLISP) is available in
> this sandbox, so this batch is not run-verified.
>
> Crystal: 5 files (2 pre-existing + 3 new: Fibonacci, a primality
> test using `Math.isqrt`, and a `struct Point` with operator
> overloading and `to_s`). No Crystal toolchain is available in this
> sandbox, so this batch is not compiler-verified.
>
> D: 5 files (2 pre-existing + 3 new: Fibonacci, a primality test, and
> binary search). No `dmd`/`ldc2` toolchain is available in this
> sandbox, so this batch is not compiler-verified.
>
> Dart: 5 files (2 pre-existing + 3 new: Fibonacci, a primality test
> using a collection-for expression, and a binary tree with an inorder
> traversal). No Dart SDK is available in this sandbox, so this batch
> is not run-verified.
>
> Elixir: 5 files (2 pre-existing + 3 new: a lazy Fibonacci sequence
> via `Stream.unfold`, a primality filter, and tuple-based pattern
> matching over shape variants). No Elixir/BEAM toolchain is available
> in this sandbox, so this batch is not run-verified.
>
> Elm: 5 files (2 pre-existing + 3 new: a tail-recursive Fibonacci
> using an accumulator, a `Maybe`-returning binary search over
> `Array`, and a `Maybe`-based safe-division/`filterMap` demo). No Elm
> compiler is available in this sandbox, so this batch is not
> compiler-verified.
>
> Erlang: 5 files (2 pre-existing + 3 new: an accumulator-based
> Fibonacci, a primality filter over a list comprehension, and a
> 1-indexed tuple binary search). No Erlang/OTP toolchain is available
> in this sandbox, so this batch is not run-verified.
>
> F#: 5 files (2 pre-existing + 3 new: a primality filter, a
> discriminated-union `Shape` type with pattern-matched `area`, and an
> `Option`-based safe-division/`List.choose` demo). No F#/dotnet
> toolchain is available in this sandbox, so this batch is not
> run-verified.
>
> Forth: 5 files (2 pre-existing + 3 new: iterative Fibonacci, GCD via
> Euclid's algorithm, and summing a `CREATE`d array via `CELLS`
> addressing). No Forth toolchain (e.g. gforth) is available in this
> sandbox, so this batch is not run-verified.
>
> GDScript: 5 files (2 pre-existing + 3 new: Fibonacci, a primality
> test, and a Godot-idiomatic `HealthComponent` using `signal` and
> `.emit()`). No Godot engine is available in this sandbox, so this
> batch is not run-verified.
>
> Groovy: 5 files (2 pre-existing + 3 new: Fibonacci, a primality
> filter, and a closure demo with a stateful counter plus
> `collect`/`inject`). No Groovy toolchain is available in this
> sandbox, so this batch is not run-verified.
>
> Julia: 5 files (2 pre-existing + 3 new: a primality filter using
> `isqrt`, binary search, and a `Point` struct with an overloaded `+`
> and a custom `Base.show` method). No Julia toolchain is available in
> this sandbox, so this batch is not run-verified.
>
> Lua: 5 files (2 pre-existing + 3 new: Fibonacci, a primality filter,
> and a closures demo with a stateful counter and a `map` helper). No
> Lua interpreter is available in this sandbox, so this batch is not
> run-verified.
>
> MATLAB: 5 files (2 pre-existing + 3 new: a primality test, binary
> search, and a matrix-operations demo covering `*`/`.*`, `trace`,
> `det`, and `inv`). No MATLAB/Octave is available in this sandbox, so
> this batch is not run-verified.
>
> Nim: 5 files (2 pre-existing + 3 new: Fibonacci, a primality filter,
> and binary search). No Nim toolchain is available in this sandbox,
> so this batch is not compiler-verified.
>
> Nix: 5 files (2 pre-existing + 3 new: an accumulator-based Fibonacci,
> GCD via Euclid's algorithm, and a list-operations demo using
> `map`/`builtins.filter`/`builtins.foldl'`). No `nix`/
> `nix-instantiate` is available in this sandbox, so this batch is not
> evaluation-verified.
>
> Objective-C: 5 files (2 pre-existing + 3 new: Fibonacci, a primality
> test, and a `Person` class implementing a `Greetable` protocol). No
> Foundation framework is available in this sandbox (only bare
> `clang`), so this batch is not compiler-verified.
>
> OCaml: 5 files (2 pre-existing + 3 new: an accumulator-based
> Fibonacci, a primality filter, and an `option`-based safe-division
> demo using `filter_map`/`fold_left`). No OCaml toolchain is available
> in this sandbox, so this batch is not compiler-verified.
>
> Pascal: 5 files (2 pre-existing + 3 new: Fibonacci, a primality
> test, and GCD via Euclid's algorithm). No `fpc` toolchain is
> available in this sandbox, so this batch is not compiler-verified.
>
> Perl: 5 files (2 pre-existing + 3 new: Fibonacci, a primality
> filter, and a regex demo covering email extraction and username
> validation). `perl` is available in this sandbox — all 5 files were
> run directly and produced correct output.
>
> PL/SQL: 5 files (2 pre-existing + 3 new: Fibonacci, GCD, and a
> cursor-based demo iterating `employees` with `%TYPE`/`%NOTFOUND`).
> No Oracle database is available in this sandbox, so this batch is
> not run-verified.
>
> PowerShell: 5 files (2 pre-existing + 3 new: Fibonacci, a primality
> test, and a pipeline demo using `Where-Object`/`ForEach-Object`/
> `Measure-Object`). No `pwsh`/`powershell` is available in this
> sandbox, so this batch is not run-verified.
>
> Prolog: 5 files (2 pre-existing + 3 new: a primality test, a
> family-tree knowledge base with `grandparent`/`sibling` relations
> derived via `findall`, and recursive list operations for sum and
> max). No `swipl` is available in this sandbox, so this batch is not
> run-verified.
>
> R: 5 files (2 pre-existing + 3 new: Fibonacci, a primality filter
> via `Filter`, and a `data.frame` demo with a derived `grade` column,
> `mean`, and sorting by `order`). No R/`Rscript` interpreter is
> available in this sandbox, so this batch is not run-verified.
>
> Racket: 5 files (2 pre-existing + 3 new: a primality filter using
> `for/and`, a recursive binary search over a vector, and a
> `#:transparent` `point` struct with a `point-add` helper). No Racket
> toolchain is available in this sandbox, so this batch is not
> run-verified.
>
> Scheme: 5 files (2 pre-existing + 3 new: a primality filter, GCD via
> Euclid's algorithm, and a higher-order-functions demo with function
> composition, `map`, and `fold-left`). No Scheme toolchain (Guile/MIT
> Scheme) is available in this sandbox, so this batch is not
> run-verified.
>
> Smalltalk: 5 files (2 pre-existing + 3 new: Fibonacci, a primality
> test, and a `MyPoint` class with an overloaded `+` and a custom
> `printOn:`). No GNU Smalltalk (`gst`) is available in this sandbox,
> so this batch is not run-verified.
>
> Standard ML: 5 files (2 pre-existing + 3 new: a primality filter, an
> `Array`-based binary search, and an `option`-based safe-division
> demo using `List.mapPartial`/`foldl`). No SML toolchain is available
> in this sandbox, so this batch is not run-verified.
>
> Solidity: 5 files (2 pre-existing + 3 new: a `FibonacciLib` library,
> an `Ownable` abstract contract with a modifier, and a
> `SimpleAuction` contract covering bidding, pending-return
> withdrawals, and events). No `solc` compiler is available in this
> sandbox, so this batch is not compiler-verified.
>
> Tcl: 5 files (2 pre-existing + 3 new: Fibonacci, a primality test,
> and GCD via Euclid's algorithm). No `tclsh` is available in this
> sandbox, so this batch is not run-verified.
>
> Vala: 5 files (2 pre-existing + 3 new: Fibonacci, a primality test,
> and binary search). No `valac` toolchain is available in this
> sandbox, so this batch is not compiler-verified.
>
> VBA: 5 files (2 pre-existing + 3 new: Fibonacci, a primality test,
> and an Excel-idiomatic `SumRange` iterating a `Range` object). No
> Excel/VBA runtime is available in this sandbox, so this batch is not
> run-verified.
>
> Verilog: 5 files (2 pre-existing + 3 new: a D flip-flop, a
> combinational full adder, and a 4-bit shift register), mirroring the
> VHDL top-up with the same set of standard digital-logic patterns. No
> Verilog toolchain (e.g. Icarus Verilog) is available in this
> sandbox, so this batch is not simulated or elaboration-verified.
>
> Vimscript: 5 files (2 pre-existing + 3 new: Fibonacci, GCD, and a
> list-operations demo using `map()`/`filter()`). `vim` is available
> in this sandbox — all 3 new scripts were run via `vim -Nes` with
> `redir` capturing output, and all produced correct output.
>
> WebAssembly (WAT): 5 files (2 pre-existing + 3 new: a primality test,
> iterative Fibonacci, and GCD, all hand-written in the text format
> using explicit `block`/`loop`/`br_if` control flow). No
> `wat2wasm`/`wasmtime` toolchain is available in this sandbox, so this
> batch is not assembled or run-verified.
>
> Zig: 5 files (2 pre-existing + 3 new: Fibonacci, a primality test,
> and an optional-returning binary search). No Zig toolchain is
> available in this sandbox, so this batch is not compiler-verified.
>
> C: 5 files (3 pre-existing + 2 new: a primality test and binary
> search), reaching the 5-file floor. Both new files were compiled
> with `gcc -std=c17 -Wall` (clean, no warnings) and run directly to
> confirm correct output.
>
> That completed the first breadth-language top-up pass: every
> language subdirectory reached at least 5 files. A second pass then
> raised the target for these 5-file languages to 10, done one
> language per batch, each individually committed and pushed.
>
> Ada: 10 files (5 pre-existing + 5 new: bubble sort, binary search, a
> `Point` record with an overloaded `"+"`, exception handling via a
> user-defined exception, and a generic `Stack_Pkg` package
> instantiated for `Integer`). No Ada toolchain is available in this
> sandbox, so this batch is not compiler-verified.
>
> Assembly (x86-64 NASM): 10 files (5 pre-existing + 5 new: bubble
> sort, a primality test, GCD, binary search, and string length),
> extending the same `_start`/`syscall exit` convention. No NASM/`ld`
> toolchain is available in this sandbox, so this batch is not
> assembled or run-verified.
>
> Awk: 10 files (5 pre-existing + 5 new: a primality filter, longest-
> line finder, line reversal, per-group field summation, and a
> `cat -n`-style line numberer). All 5 new files were run against
> sample input via `awk` and verified to produce correct output.
>
> Bash: 10 files (5 pre-existing + 5 new, though one attempt
> accidentally overwrote the pre-existing `word_count.sh`; it was
> restored from git and the intended new script kept under a different
> name instead: binary search over a nameref array, an
> associative-array word-frequency counter [`word_freq_assoc.sh`],
> GCD, and a file-line-counter that reports missing files without
> aborting the script). All 4 new runnable scripts were executed
> directly and verified to produce correct output.
>
> C: 10 files (5 pre-existing + 5 new: Fibonacci, a linked list, a
> stack, quicksort, and in-place string reversal). All 5 new files
> were compiled with `gcc -std=c17 -Wall` (clean, no warnings) and run
> directly, producing correct output.
>
> Clojure: 10 files (5 pre-existing + 5 new: binary search, merge
> sort, a `defrecord Point` with a `point-add` helper, `->`/`->>`
> threading-macro demos, and a `defmulti`/`defmethod` polymorphic
> `area` dispatch). No Clojure/JVM toolchain is available in this
> sandbox, so this batch is not run-verified.
>
> COBOL: 10 files (5 pre-existing + 5 new: bubble sort, binary search,
> array summation, string reversal via reference modification, and
> max-of-array). No GnuCOBOL toolchain is available in this sandbox,
> so this batch is not compiler-verified.
>
> Common Lisp: 10 files (5 pre-existing + 5 new: destructive bubble
> sort via `rotatef`, GCD, a `defstruct point` with a `point-add`
> helper, `mapcar`/`remove-if-not`/`reduce`, and `handler-case`-based
> condition handling for safe division). No CL toolchain is available
> in this sandbox, so this batch is not run-verified.
>
> Crystal: 10 files (5 pre-existing + 5 new: bubble sort, binary
> search, GCD, a `Greetable` module included into `Person`, and a
> custom `DivisionByZeroError` exception with `begin`/`rescue`). No
> Crystal toolchain is available in this sandbox, so this batch is not
> compiler-verified.
>
> D: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a `Point`
> struct with `opBinary` operator overloading, a range-pipeline demo
> using `filter`/`map`/`fold`, and a custom exception with
> `try`/`catch`). No `dmd`/`ldc2` toolchain is available in this
> sandbox, so this batch is not compiler-verified.
>
> Dart: 10 files (5 pre-existing + 5 new: bubble sort, GCD, an
> abstract `Shape` class hierarchy, a `Future`/`async`/`await` demo
> with `Future.wait`, and a null-safety demo using `?`/`??`). No Dart
> SDK is available in this sandbox, so this batch is not run-verified.
>
> Elixir: 10 files (5 pre-existing + 5 new: bubble sort, GCD via
> pattern-matched clauses, a `Point` defstruct with `add/2`, a `|>`
> pipe-operator demo, and a `with` demo chaining safe-division
> results). No Elixir/BEAM toolchain is available in this sandbox, so
> this batch is not run-verified.
>
> Elm: 10 files (5 pre-existing + 5 new: GCD, merge sort, a `Point`
> record with `addPoints`, a `Result`-based safe-division chain using
> `Result.andThen`, and a list pipeline for even-square summation). No
> Elm compiler is available in this sandbox, so this batch is not
> compiler-verified.
>
> Erlang: 10 files (5 pre-existing + 5 new: bubble sort, GCD via
> pattern-matched clauses, a `#point{}` record with `add_points/2`, a
> list-comprehension even-squares demo, and `try`/`catch` for safe
> division). No Erlang/OTP toolchain is available in this sandbox, so
> this batch is not run-verified.
>
> Forth: 10 files (5 pre-existing + 5 new: bubble sort, binary search
> — both using `VARIABLE`s rather than deep stack juggling to keep the
> control flow legible, string length via `S"`, a stack-based `MAX2`
> chain, and a squares loop). One early draft of `bubble_sort.fs`
> accidentally overwrote `is_prime.fs`'s test value (7 -> 17); it was
> restored via `git checkout` before committing. No Forth toolchain
> (e.g. gforth) is available in this sandbox, so this batch is not
> run-verified.
>
> Fortran (free-form `.f90`): 10 files (5 pre-existing + 5 new: binary
> search, a `point` derived type with field-wise addition, array
> statistics via `sum`/`maxval`/`minval`, factorial using a `contains`
> function, and in-place string reversal). No `gfortran` toolchain is
> available in this sandbox, so this batch is not compiler-verified.
>
> F#: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a `Point`
> record with `addPoints`, a `|>` pipeline demo, and a custom
> `(|Even|Odd|)` active pattern used in a `match`). No F#/dotnet
> toolchain is available in this sandbox, so this batch is not
> run-verified.
>
> GDScript: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a
> `Shape` class with `Circle`/`Rectangle` inner classes, array
> operations using lambda-based `filter`/`map`, and a dictionary
> demo). No Godot engine is available in this sandbox, so this batch
> is not run-verified.
>
> Groovy: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a
> `Point` class with an overloaded `plus`, a `GString`/interpolation
> demo, and `try`/`catch` for safe division). No Groovy toolchain is
> available in this sandbox, so this batch is not run-verified.
>
> Julia: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a
> multiple-dispatch `area` over `Circle`/`Rectangle <: Shape`, an
> array-comprehension demo, and exception handling with `try`/`catch`
> and a custom `DomainError`). No Julia toolchain is available in this
> sandbox, so this batch is not run-verified.
>
> Lua: 10 files (5 pre-existing + 5 new: binary search, GCD, a `Point`
> metatable with `__add`/`__tostring`, a `coroutine.yield`-based
> counter, and `pcall`-based error handling). No Lua interpreter is
> available in this sandbox, so this batch is not run-verified.
>
> MATLAB: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a
> struct-based `Point` addition, a cell-array demo iterating names
> alongside a numeric `scores` array, and `try`/`catch` with a custom
> error identifier). One early attempt accidentally overwrote the
> pre-existing `fibonacci.m`; it was restored via `git checkout` and
> the new struct demo was written to a separate file instead. No
> MATLAB/Octave is available in this sandbox, so this batch is not
> run-verified.
>
> Nim: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a `Point`
> object with an overloaded `+`, a `sequtils`-based `filterIt`/
> `mapIt`/`foldl` pipeline, and a custom `DivisionByZeroError` with
> `try`/`except`). No Nim toolchain is available in this sandbox, so
> this batch is not compiler-verified.
>
> Nix: 10 files (5 pre-existing + 5 new: bubble sort via nested
> `builtins.foldl'`/`genList`, an attrset-based `Point` addition,
> binary search, string helpers, and recursive `factorial`/
> `fibonacci`). No `nix`/`nix-instantiate` is available in this
> sandbox, so this batch is not evaluation-verified.
>
> Objective-C: 10 files (5 pre-existing + 5 new: bubble sort over
> `NSMutableArray`, GCD, binary search, a `MyPoint` class with an
> `add:` method and custom `description`, and a `Blocks`-based
> `IntTransform` demo). No Foundation framework is available in this
> sandbox (only bare `clang`), so this batch is not compiler-verified.
>
> OCaml: 10 files (5 pre-existing + 5 new: in-place bubble sort, GCD,
> a `point` record with `add_points`, a `shape` variant type with a
> pattern-matched `area`, and a custom `Division_by_zero` exception
> with `try`/`with`). No OCaml toolchain is available in this sandbox,
> so this batch is not compiler-verified.
>
> Pascal: 10 files (5 pre-existing + 5 new: bubble sort, binary
> search, a `TPoint` record with `AddPoints`, recursive factorial, and
> string reversal). No `fpc` toolchain is available in this sandbox,
> so this batch is not compiler-verified.
>
> Perl: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a hash
> demo with sorted-key iteration and averaging, a `Point` package with
> `new`/`add`/`to_string`, and `eval`/`$@`-based error handling). All 5
> new files were run through the `perl` interpreter; the bubble-sort
> inner loop had an off-by-one bound that skipped the last pair
> (caught by the run, fixed, and re-verified) before all 5 produced
> correct output.
>
> PL/SQL: 10 files (5 pre-existing + 5 new: bubble sort and binary
> search over a `TABLE OF NUMBER` collection type, a `point_rec`
> record, `ZERO_DIVIDE` exception handling, and string reversal via
> `SUBSTR`). No Oracle database is available in this sandbox, so this
> batch is not run-verified.
>
> PowerShell: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a
> `Point` class with `Add`/`ToString`, `try`/`catch` for safe
> division, and a `Hashtable` demo with `Measure-Object -Average`). No
> `pwsh`/`powershell` is available in this sandbox, so this batch is
> not run-verified.
>
> Prolog: 10 files (5 pre-existing + 5 new: bubble sort via a
> swap/pass relation, GCD, binary search, an `animal_facts` knowledge
> base with `warm_blooded/1`, and recursive factorial). No `swipl` is
> available in this sandbox, so this batch is not run-verified.
>
> R: 10 files (5 pre-existing + 5 new: GCD, binary search, an S3
> `Point` class with an operator method (`+.Point`) and a `print`
> method, `sapply`/`Filter`/`Reduce`, and `tryCatch`-based error
> handling). One attempt accidentally overwrote the pre-existing
> `bubble_sort.R`; it was restored via `git checkout` and no
> duplicate was written. No R/`Rscript` interpreter is available in
> this sandbox, so this batch is not run-verified.
>
> Racket: 10 files (5 pre-existing + 5 new: bubble sort over a mutable
> vector, GCD, a `map`/`filter`/`foldl` demo, a hash-table demo, and
> `with-handlers`-based exception handling). No Racket toolchain is
> available in this sandbox, so this batch is not run-verified.
>
> Scheme: 10 files (5 pre-existing + 5 new: bubble sort, binary
> search, recursive factorial, an association-list demo, and a
> tail-recursive `sum-to` accumulator). No Scheme toolchain
> (Guile/MIT Scheme) is available in this sandbox, so this batch is
> not run-verified.
>
> Smalltalk: 10 files (5 pre-existing + 5 new: bubble sort, GCD,
> binary search, recursive factorial, and a collection demo using
> `select:`/`collect:`/`inject:into:`). No GNU Smalltalk (`gst`) is
> available in this sandbox, so this batch is not run-verified.
>
> Standard ML: 10 files (5 pre-existing + 5 new: bubble sort over an
> `Array` using explicit recursive loops (SML has no `for` loop), GCD,
> a `point` record type with `addPoints`, a `shape` datatype with a
> pattern-matched `area`, and a custom `DivisionByZero` exception with
> `handle`). No SML toolchain is available in this sandbox, so this
> batch is not run-verified.
>
> Solidity: 10 files (5 pre-existing + 5 new: a minimal ERC-20 token
> with `transfer`/`approve`/`transferFrom`, a `BinarySearchLib`
> library, a `Pausable` abstract contract, a `Person[]` struct-array
> demo, and Solidity 0.8.4+ custom `error` types with `revert`). No
> `solc` compiler is available in this sandbox, so this batch is not
> compiler-verified.
>
> Tcl: 10 files (5 pre-existing + 5 new: bubble sort, binary search, a
> `dict`-based scores demo, recursive factorial, and `catch`-based
> error handling). No `tclsh` is available in this sandbox, so this
> batch is not run-verified.
>
> Vala: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a `Point`
> class with GObject-style properties and an `add` method, recursive
> factorial, and an `errordomain`-based exception demo with
> `throws`/`try`/`catch`). No `valac` toolchain is available in this
> sandbox, so this batch is not compiler-verified.
>
> VBA: 10 files (5 pre-existing + 5 new: bubble sort, GCD, binary
> search, a class-module `Point` sketch, and `On Error GoTo`-based
> error handling for safe division). No Excel/VBA runtime is available
> in this sandbox, so this batch is not run-verified.
>
> Verilog: 10 files (5 pre-existing + 5 new: a half adder, a JK
> flip-flop, a 2-to-4 decoder, a 4-bit comparator, and a 3-state
> traffic-light FSM). No Verilog toolchain is available in this
> sandbox, so this batch is not simulated or elaboration-verified.
>
> VHDL: 10 files (5 pre-existing + 5 new: a half adder, a JK
> flip-flop, a 2-to-4 decoder, an unsigned comparator, and a 3-state
> traffic-light FSM), mirroring the Verilog top-up with the same set
> of standard digital-logic patterns. No VHDL toolchain (e.g. GHDL) is
> available in this sandbox, so this batch is not simulated or
> elaboration-verified.
>
> Vimscript: 10 files (5 pre-existing + 5 new: bubble sort, binary
> search, a dict demo, recursive factorial, and `try`/`catch`/
> `v:exception`-based error handling). `vim` is available in this
> sandbox — all 5 new files were run via `vim -Nes` with `redir`
> capturing output, and all produced correct output.
>
> WebAssembly (WAT): 10 files (5 pre-existing + 5 new: bubble sort and
> binary search over a linear-memory `i32` array, max-of-array,
> multiply, and a null-terminated `string_length`), continuing the
> hand-written `block`/`loop`/`br_if` style. No `wat2wasm`/`wasmtime`
> toolchain is available in this sandbox, so this batch is not
> assembled or run-verified.
>
> Zig: 10 files (5 pre-existing + 5 new: bubble sort, GCD, a `Point`
> struct with an `add` method, a `MathError` error-set demo using
> `catch |err|`, and recursive factorial). No Zig toolchain is
> available in this sandbox, so this batch is not compiler-verified.
>
> That completes the second breadth-language pass: every language
> subdirectory previously at the 5-file floor is now at 10 files (the
> flagship 8 stay at 100+, PHP/Ruby at 50, Swift at 25, Kotlin at 12,
> and Scala at 10).
>
> A third pass then set new targets: 100 files for the flagship
> languages (already satisfied) and 50 files for everything else.
> Swift went first: 51 files (25 pre-existing + 26 new), adding heap
> sort, sieve of Eratosthenes, Kadane's max-subarray, anagram check,
> Roman numerals, a trie, an LRU cache, Dijkstra, coin change, LCS,
> observer/factory/builder patterns, topological sort, generics,
> `Codable` JSON parsing, `NSRegularExpression`-based regex, KMP
> string search, N-Queens, word frequency, `Result`-based validation,
> lazy sequences, a `@propertyWrapper` demo, `async`/`await` with
> `async let`, a `CustomStringConvertible` error enum, and a disjoint
> set. No Swift toolchain is available in this sandbox, so this batch
> is not compiler-verified.
>
> Kotlin: 50 files (12 pre-existing + 38 new): heap sort, sieve of
> Eratosthenes, Kadane's max-subarray, valid parentheses, Roman
> numerals, a trie, an LRU cache via `LinkedHashMap`, Dijkstra, coin
> change, LCS, observer pattern, a sealed-class `Shape` hierarchy,
> `kotlinx.coroutines` (`async`/`await`, `Flow`), extension functions,
> data classes, null safety, higher-order functions, a generic stack,
> an exception hierarchy, a singleton `object`, tail-recursive
> factorial, binary tree traversals, union-find, 0/1 knapsack, word
> frequency, delegated properties, inline functions, a `when`
> expression, a circular buffer, a builder pattern, simple JSON-like
> parsing, topological sort, a segment tree, operator overloading,
> cycle detection, a `PriorityQueue` demo, and an `enum class`. No
> Kotlin toolchain is available in this sandbox, so this batch is not
> compiler-verified.
>
> Scala: 50 files (10 pre-existing + 40 new): heap sort, sieve of
> Eratosthenes, Kadane's max-subarray, valid parentheses, two-sum, a
> trie, Dijkstra, coin change, LCS, 0/1 knapsack, union-find,
> topological sort, a binary tree, `for`-comprehensions, implicit
> classes, `Future`/`for`-yield concurrency, `Either`-based error
> handling, companion objects, a generic stack, pattern matching over
> `Any`, `lazy val`, word frequency, Roman numerals, a builder
> pattern, an exception hierarchy, `@tailrec` factorial, a circular
> buffer, a segment tree, operator overloading via `case class`, a
> `mutable.PriorityQueue`-based heap, `Enumeration`, cycle detection,
> a linked list, GCD, `LazyList`-based infinite Fibonacci, partial
> functions, `case object` traffic-light states, `foldLeft`/
> `foldRight`, simple JSON stringification, and immutable
> `Vector`/`Map` updates. No Scala toolchain is available in this
> sandbox, so this batch is not compiler-verified.
>
> A fourth pass then began raising every remaining 10-file language to
> 50, one language per batch, continuing until all are done. Ada went
> first: 50 files (10 pre-existing + 40 new) covering sorting/
> searching (heap sort, sieve of Eratosthenes, insertion/selection
> sort, merge sort), DP (max-subarray, coin change, knapsack, edit
> distance), core data structures (linked list, binary tree, stack,
> queue, union-find), and idiomatic Ada: tagged types with overriding
> `Area`, a package-based singleton counter, enumerations, and 2D
> matrix multiplication. Two early files (`is_power_of_two.adb`,
> `leap_year.adb`) referenced a nonexistent `Integer_Array` type and
> were fixed in place before commit. No Ada toolchain is available in
> this sandbox, so this batch is not compiler-verified.
>
> Assembly (x86-64 NASM) went next: 50 files (10 pre-existing + 40
> new), extending the `_start`/`syscall exit` convention across
> sorting (insertion sort), searching (linear index, second-largest),
> bit tricks (popcount, lowest-set-bit isolation, XOR swap, rotate,
> power-of-two check), arithmetic (LCM, digit sum, Collatz steps,
> Armstrong number, integer square root via binary search), memory
> ops (`rep movsb` copy, array fill/double/reverse), and control-flow
> idioms (recursive function calls via `push`/`pop`/`call`/`ret`,
> stack-frame locals, `cmovg` branchless max). No NASM/`ld` toolchain
> is available in this sandbox, so this batch is not assembled or
> run-verified.
>
> Awk: 50 files (10 pre-existing + 40 new): field filtering/
> transformation, deduplication, CSV/JSON-ish/TSV conversion, GCD,
> factorial, a Sieve-style primality range, a palindrome checker,
> grouped averages, a histogram, Celsius-to-Fahrenheit and leap-year
> checks, and more field-processing idioms (split, trim, swap, running
> total, count-by-key, longest word, field reversal). A first batch
> undercounted at 30 new files; a follow-up batch added the remaining
> 10 to reach 50. All 40 new files were run against sample input via
> `awk` and verified to produce correct output.

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
