declare const brand: unique symbol;
type UserId = number & { [brand]: true };
const uid = (n: number) => n as UserId;
function find(id: UserId) { return `user ${id}`; }
console.log(find(uid(5)));
