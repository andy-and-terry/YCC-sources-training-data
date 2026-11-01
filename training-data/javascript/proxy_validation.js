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
console.log(person.age);
try { person.age = "x"; } catch (e) { console.log(e.message); }
