const Colors = ["red", "green", "blue"] as const;
type Color = typeof Colors[number];

function paint(c: Color) { return `painting ${c}`; }
console.log(paint("green"));

enum Dir { Up = 1, Down, Left, Right }
console.log(Dir[2], Dir.Left);
