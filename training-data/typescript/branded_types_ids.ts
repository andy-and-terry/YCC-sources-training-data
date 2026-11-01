type Brand<T, B extends string> = T & { readonly __brand: B };
type UserId = Brand<number, "UserId">;
type OrderId = Brand<number, "OrderId">;

const userId = (n: number) => n as UserId;
const orderId = (n: number) => n as OrderId;

function loadUser(id: UserId) { return `user ${id}`; }

console.log(loadUser(userId(1)));
// loadUser(orderId(1)); // compile error
console.log(orderId(2));
