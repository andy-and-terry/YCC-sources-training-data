type EventName = "click" | "hover" | "focus";
type HandlerName = `on${Capitalize<EventName>}`;

type EventHandlers = {
  [K in HandlerName]: (event: EventName) => void;
};

const handlers: EventHandlers = {
  onClick: (event) => console.log(`handled ${event}`),
  onHover: (event) => console.log(`handled ${event}`),
  onFocus: (event) => console.log(`handled ${event}`),
};

handlers.onClick("click");

type Route = "/users" | "/users/:id" | "/posts/:id/comments";
type ExtractParams<R extends string> = R extends `${string}:${infer Param}/${infer Rest}`
  ? Param | ExtractParams<`/${Rest}`>
  : R extends `${string}:${infer Param}`
  ? Param
  : never;

type CommentParams = ExtractParams<"/posts/:id/comments">;
const params: Record<CommentParams, string> = { id: "42" };
console.log(params);
