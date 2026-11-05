type Method = "get" | "post";
type Route = `/${string}`;
type Handler = `${Method}:${Route}`;

const h: Handler = "get:/users";
type EventName<T extends string> = `on${Capitalize<T>}`;
const ev: EventName<"click"> = "onClick";
console.log(h, ev);
