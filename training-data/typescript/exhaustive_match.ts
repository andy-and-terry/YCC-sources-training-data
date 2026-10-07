type Shape =
  | { kind: "circle"; radius: number }
  | { kind: "square"; side: number }
  | { kind: "rectangle"; width: number; height: number };

type Handlers<T extends { kind: string }, R> = {
  [K in T["kind"]]: (shape: Extract<T, { kind: K }>) => R;
};

function match<T extends { kind: string }, R>(value: T, handlers: Handlers<T, R>): R {
  const handler = handlers[value.kind as T["kind"]] as (shape: T) => R;
  return handler(value);
}

const area = (shape: Shape): number =>
  match(shape, {
    circle: (s) => Math.PI * s.radius ** 2,
    square: (s) => s.side ** 2,
    rectangle: (s) => s.width * s.height,
  });

const shapes: Shape[] = [
  { kind: "circle", radius: 2 },
  { kind: "square", side: 3 },
  { kind: "rectangle", width: 4, height: 5 },
];

console.log(shapes.map(area));

// Adding a new Shape variant without adding a matching handler entry is a
// compile-time error, since `Handlers<T, R>` requires a key for every `kind`.
