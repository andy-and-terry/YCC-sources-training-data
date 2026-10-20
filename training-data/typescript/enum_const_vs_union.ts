const enum Dir { Up, Down }
type Mode = "r" | "w";
function open(m: Mode) { return m === "r" ? Dir.Up : Dir.Down; }
console.log(open("r"), open("w"));
