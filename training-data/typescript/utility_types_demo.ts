interface User {
  id: string;
  name: string;
  email: string;
  age: number;
}

type UserUpdate = Partial<Omit<User, 'id'>>;
type UserSummary = Pick<User, 'id' | 'name'>;
type ReadonlyUser = Readonly<User>;

function applyUpdate(user: User, update: UserUpdate): User {
  return { ...user, ...update };
}

function toSummary(user: User): UserSummary {
  return { id: user.id, name: user.name };
}

const user: ReadonlyUser = { id: '1', name: 'Alice', email: 'alice@example.com', age: 30 };
const updated = applyUpdate(user, { age: 31 });
console.log(updated, toSummary(updated));
