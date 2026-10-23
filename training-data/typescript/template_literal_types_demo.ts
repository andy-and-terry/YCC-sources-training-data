type Color = "red" | "blue";
type Size = "sm" | "lg";
type ClassName = `${Color}-${Size}`;

const c: ClassName = "red-lg";

type EventName<T extends string> = `on${Capitalize<T>}`;
const handler: EventName<"click"> = "onClick";

type Route = `/users/${number}`;
const r: Route = "/users/42";

type Split<S extends string> = S extends `${infer H}.${infer T}` ? [H, ...Split<T>] : [S];
const parts: Split<"a.b.c"> = ["a", "b", "c"];
console.log(c, handler, r, parts);
