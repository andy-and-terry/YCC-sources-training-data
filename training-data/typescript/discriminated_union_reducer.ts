type Action =
  | { type: "add"; item: string }
  | { type: "remove"; index: number }
  | { type: "clear" };

function reducer(state: string[], action: Action): string[] {
  switch (action.type) {
    case "add":
      return [...state, action.item];
    case "remove":
      return state.filter((_, i) => i !== action.index);
    case "clear":
      return [];
  }
}

let s: string[] = [];
s = reducer(s, { type: "add", item: "a" });
s = reducer(s, { type: "add", item: "b" });
s = reducer(s, { type: "remove", index: 0 });
console.log(s);
