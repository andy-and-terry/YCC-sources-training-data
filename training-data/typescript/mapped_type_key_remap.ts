interface User {
  id: number;
  name: string;
  email?: string;
}

type Mutable<T> = { -readonly [K in keyof T]: T[K] };
type Nullable<T> = { [K in keyof T]: T[K] | null };
type Getters<T> = { [K in keyof T as `get${Capitalize<string & K>}`]: () => T[K] };

const frozen: Readonly<User> = { id: 1, name: "Ann" };
const draft: Mutable<Readonly<User>> = { ...frozen };
draft.name = "Bob";
const maybe: Nullable<User> = { id: null, name: "x", email: null };
const g: Getters<User> = { getId: () => 1, getName: () => "a", getEmail: () => undefined };
console.log(draft, maybe, g.getName());
