const validator = {
  set(target, prop, value) {
    if (prop === "age" && !Number.isInteger(value)) {
      throw new TypeError("age must be an integer");
    }
    target[prop] = value;
    return true;
  },
  get(target, prop) {
    return prop in target ? target[prop] : `<no ${String(prop)}>`;
  },
};

const person = new Proxy({}, validator);
person.age = 30;
console.log(person.age, person.name);
try {
  person.age = "old";
} catch (e) {
  console.log(e.message);
}
