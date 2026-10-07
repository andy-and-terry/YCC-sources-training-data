function createValidatedUser(initial = {}) {
  const schema = {
    name: (v) => typeof v === "string" && v.length > 0,
    age: (v) => typeof v === "number" && v >= 0,
  };

  return new Proxy(initial, {
    set(target, prop, value) {
      const validator = schema[prop];
      if (validator && !validator(value)) {
        throw new TypeError(`invalid value for ${String(prop)}: ${value}`);
      }
      return Reflect.set(target, prop, value);
    },
    get(target, prop) {
      if (!(prop in target)) {
        console.log(`warning: accessed undefined property "${String(prop)}"`);
      }
      return Reflect.get(target, prop);
    },
  });
}

function createLoggingProxy(target, label) {
  return new Proxy(target, {
    get(obj, prop) {
      const value = Reflect.get(obj, prop);
      if (typeof value === "function") {
        return (...args) => {
          console.log(`${label}.${String(prop)}(${args.join(", ")})`);
          return value.apply(obj, args);
        };
      }
      return value;
    },
  });
}

const user = createValidatedUser();
user.name = "Ada";
user.age = 30;
console.log(user.name, user.age);

try {
  user.age = -5;
} catch (err) {
  console.log(err.message);
}

const calculator = createLoggingProxy(
  {
    add(a, b) {
      return a + b;
    },
  },
  "calculator"
);
console.log(calculator.add(2, 3));

module.exports = { createValidatedUser, createLoggingProxy };
