// Branded types give structurally identical primitives distinct identities.
type Brand<T, B extends string> = T & { readonly __brand: B };
type UserId = Brand<number, "UserId">;
type OrderId = Brand<number, "OrderId">;

const userId = (n: number) => n as UserId;
const orderId = (n: number) => n as OrderId;

function findUser(id: UserId): string {
  return `user#${id}`;
}

console.log(findUser(userId(7)));
// findUser(orderId(7)); // error: OrderId not assignable to UserId
console.log(orderId(1));
