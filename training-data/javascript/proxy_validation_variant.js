const validator = {
  set(target, key, value) {
    if (key === "age" && !Number.isInteger(value)) {
      throw new TypeError("age must be an integer");
    }
    target[key] = value;
    return true;
  },
};

const person = new Proxy({}, validator);
person.age = 30;
try {
  person.age = "old";
} catch (e) {
  console.log(e.message);
}
console.log(person.age);
