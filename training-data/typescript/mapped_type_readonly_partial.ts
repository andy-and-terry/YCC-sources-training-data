type Mutable<T> = { -readonly [K in keyof T]: T[K] };
type Nullable<T> = { [K in keyof T]: T[K] | null };

interface User {
  readonly id: number;
  name: string;
}

const draft: Mutable<User> = { id: 1, name: "a" };
draft.id = 2;

const empty: Nullable<User> = { id: null, name: null };
console.log(draft, empty);
