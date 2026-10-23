class Animal {
  constructor(public name: string) {}

  speak(): string {
    return `${this.name} makes a sound`;
  }

  describe(): string {
    return `Animal(${this.name})`;
  }
}

class Dog extends Animal {
  override speak(): string {
    return `${this.name} barks`;
  }

  override describe(): string {
    return `Dog:${super.describe()}`;
  }

  // Using "override" on a method that does not exist in the base class
  // is a compile-time error, which catches typos and renames.
  fetch(): string {
    return `${this.name} fetches`;
  }
}

const animals: Animal[] = [new Animal("Generic"), new Dog("Rex")];
for (const a of animals) {
  console.log(a.speak(), "|", a.describe());
}
console.log(new Dog("Fido").fetch());
