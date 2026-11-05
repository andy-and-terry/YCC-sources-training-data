interface Cat { meow(): void }
interface Dog { bark(): void }

function isCat(a: Cat | Dog): a is Cat {
  return (a as Cat).meow !== undefined;
}

function speak(a: Cat | Dog) {
  if (isCat(a)) a.meow();
  else a.bark();
}

speak({ meow: () => console.log("meow") });
speak({ bark: () => console.log("woof") });
