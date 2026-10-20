interface Cat {
  meow(): string;
}
interface Dog {
  bark(): string;
}

function isCat(pet: Cat | Dog): pet is Cat {
  return (pet as Cat).meow !== undefined;
}

function speak(pet: Cat | Dog): string {
  return isCat(pet) ? pet.meow() : pet.bark();
}

console.log(speak({ meow: () => "meow" }), speak({ bark: () => "woof" }));
