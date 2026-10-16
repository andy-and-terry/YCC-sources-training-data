const person = {
  name: "Ada",
  greet(greeting, punct) {
    return `${greeting}, ${this.name}${punct}`;
  },
  delayed() {
    return [1].map(() => this.name);
  },
};

const other = { name: "Grace" };
console.log(person.greet("Hi", "!"));
console.log(person.greet.call(other, "Hello", "?"));
console.log(person.greet.apply(other, ["Hey", "."]));

const bound = person.greet.bind(other, "Yo");
console.log(bound("~"));

const detached = person.greet;
console.log("detached:", detached("Hi", "!"));
console.log(person.delayed());
