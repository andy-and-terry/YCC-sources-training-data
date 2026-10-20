// Mapped type with key remapping: derive getter names from an object type.
type Getters<T> = {
  [K in keyof T as `get${Capitalize<string & K>}`]: () => T[K];
};

interface User {
  name: string;
  age: number;
}

const user: Getters<User> = {
  getName: () => "Grace",
  getAge: () => 36,
};

console.log(user.getName(), user.getAge());
