const enum Dir { Up, Down }
const Color = { Red: "red", Green: "green" } as const;
type Color = typeof Color[keyof typeof Color];

function paint(c: Color) { return `painting ${c}`; }
console.log(Dir.Down, paint(Color.Green));
