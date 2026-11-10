const pieces = (cuts: number): number => (cuts * cuts + cuts + 2) / 2;
console.log(Array.from({ length: 10 }, (_, n) => pieces(n)).join(" ")); // 1 2 4 7 11 16 22 29 37 46
