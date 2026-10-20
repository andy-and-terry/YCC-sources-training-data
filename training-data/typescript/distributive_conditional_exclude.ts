type NonStr<T> = T extends string ? never : T;
type X = NonStr<string | number | boolean>;
const x: X[] = [1, true];
console.log(x);
