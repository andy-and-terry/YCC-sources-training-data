type Brand<T, B> = T & { __brand: B };
type UserId = Brand<number, "UserId">;
type OrderId = Brand<number, "OrderId">;

const uid = (n: number) => n as UserId;
function loadUser(id: UserId) { return `user ${id}`; }

console.log(loadUser(uid(3)));
// loadUser(5 as OrderId); // type error
