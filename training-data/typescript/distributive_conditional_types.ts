type ToArray<T> = T extends unknown ? T[] : never;
type ToArrayNoDist<T> = [T] extends [unknown] ? T[] : never;

type A = ToArray<string | number>;
type B = ToArrayNoDist<string | number>;

type NonNullableKeys<T> = {
  [K in keyof T]-?: null extends T[K] ? never : undefined extends T[K] ? never : K;
}[keyof T];

interface Profile {
  id: number;
  nickname: string | null;
  bio?: string;
  email: string;
}

type Required3 = NonNullableKeys<Profile>;

const a: A = ["x"];
const a2: A = [1, 2];
const b: B = [1, "two"];
const keys: Required3[] = ["id", "email"];

console.log(a, a2, b, keys);
