type BuildTuple<N extends number, T extends unknown[] = []> = T["length"] extends N
  ? T
  : BuildTuple<N, [...T, unknown]>;

type Add<A extends number, B extends number> = [...BuildTuple<A>, ...BuildTuple<B>]["length"];

type Subtract<A extends number, B extends number> = BuildTuple<A> extends [...BuildTuple<B>, ...infer Rest]
  ? Rest["length"]
  : never;

type LessThan<A extends number, B extends number> = BuildTuple<A> extends [...BuildTuple<B>, ...unknown[]]
  ? false
  : true;

type IntRange<Start extends number, End extends number, Acc extends number[] = []> = Start extends End
  ? Acc[number]
  : IntRange<Add<Start, 1>, End, [...Acc, Start]>;

type Sum = Add<3, 4>;
type Diff = Subtract<10, 4>;
type Smaller = LessThan<2, 9>;
type ZeroToFour = IntRange<0, 5>;

const sum: Sum = 7;
const diff: Diff = 6;
const smaller: Smaller = true;
const index: ZeroToFour = 3;

console.log(sum, diff, smaller, index);

// This only scales to small numbers, since each step builds a tuple whose
// length equals the value, but it shows how tuple length can stand in for
// numeric literals in purely type-level computation.
