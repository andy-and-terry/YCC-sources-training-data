type EventName = 'click' | 'hover' | 'focus';
type HandlerName = `on${Capitalize<EventName>}`;

type EventHandlers = {
  [K in EventName as `on${Capitalize<K>}`]: (event: K) => void;
};

const handlers: EventHandlers = {
  onClick: (event) => console.log(`handled ${event}`),
  onHover: (event) => console.log(`handled ${event}`),
  onFocus: (event) => console.log(`handled ${event}`),
};

const registered: HandlerName[] = ['onClick', 'onHover', 'onFocus'];
console.log(registered);
handlers.onClick('click');

type Route = '/users' | '/users/:id' | '/posts/:id/comments';
type ExtractParams<T extends string> = T extends `${string}:${infer Param}/${infer Rest}`
  ? Param | ExtractParams<`/${Rest}`>
  : T extends `${string}:${infer Param}`
    ? Param
    : never;

type PostCommentParams = ExtractParams<'/posts/:id/comments/:commentId'>;

function buildPath(base: string, params: Record<string, string>): string {
  return Object.entries(params).reduce((path, [key, value]) => path.replace(`:${key}`, value), base);
}

const params: Record<PostCommentParams, string> = { id: '42', commentId: '7' };
console.log(buildPath('/posts/:id/comments/:commentId', params));

type CssUnit = 'px' | 'em' | 'rem' | '%';
type CssLength = `${number}${CssUnit}`;

function setWidth(value: CssLength): string {
  return `width: ${value};`;
}

console.log(setWidth('100px'));
console.log(setWidth('1.5rem'));
