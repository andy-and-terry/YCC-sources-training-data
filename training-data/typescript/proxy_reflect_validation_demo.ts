interface User {
  name: string;
  age: number;
}

function validated<T extends object>(target: T, rules: Partial<Record<keyof T, (v: unknown) => boolean>>): T {
  return new Proxy(target, {
    set(obj, prop, value, receiver) {
      const rule = rules[prop as keyof T];
      if (rule && !rule(value)) {
        throw new TypeError(`invalid value for ${String(prop)}: ${String(value)}`);
      }
      return Reflect.set(obj, prop, value, receiver);
    },
    get(obj, prop, receiver) {
      console.log(`read ${String(prop)}`);
      return Reflect.get(obj, prop, receiver);
    },
  });
}

const user = validated<User>(
  { name: "Ada", age: 36 },
  {
    age: (v) => typeof v === "number" && v >= 0,
    name: (v) => typeof v === "string" && v.length > 0,
  },
);

user.age = 37;
console.log(user.age);
try {
  user.age = -1;
} catch (e) {
  console.log((e as Error).message);
}
console.log(Reflect.has(user, "name"), Reflect.ownKeys(user));
