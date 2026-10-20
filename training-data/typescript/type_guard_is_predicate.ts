interface Fish { swim(): void }
interface Bird { fly(): void }
function isFish(p: Fish | Bird): p is Fish { return (p as Fish).swim !== undefined; }
const pet: Fish | Bird = { swim() { console.log("swim"); } };
if (isFish(pet)) pet.swim();
