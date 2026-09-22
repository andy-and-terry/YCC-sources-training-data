type Brand<T, B extends string> = T & { readonly __brand: B };

type UserId = Brand<number, "UserId">;
type OrderId = Brand<number, "OrderId">;

function toUserId(id: number): UserId {
  return id as UserId;
}

function toOrderId(id: number): OrderId {
  return id as OrderId;
}

function getUserName(id: UserId): string {
  return `user-${id}`;
}

const userId = toUserId(1);
const orderId = toOrderId(1);

console.log(getUserName(userId));
// getUserName(orderId) would be a compile-time error despite both being numbers
console.log(userId === (orderId as unknown as UserId));
