interface User {
  id: number;
  name: string;
  address: { city: string; zip: string };
  tags: string[];
}

type Id = User["id"];
type Address = User["address"];
type City = User["address"]["city"];
type NameOrId = User["name" | "id"];
type Tag = User["tags"][number];

const id: Id = 7;
const addr: Address = { city: "Oslo", zip: "0150" };
const city: City = addr.city;
const key: NameOrId = "alice";
const tag: Tag = "admin";

function getField<K extends keyof User>(user: User, field: K): User[K] {
  return user[field];
}

const user: User = { id, name: "Alice", address: addr, tags: [tag] };
console.log(getField(user, "name"), getField(user, "tags").length, city, key);

const tuple = [1, "a", true] as const;
type Elem = (typeof tuple)[number];
const e: Elem = "a";
console.log(e);
