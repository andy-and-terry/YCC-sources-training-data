function swap<A, B>(pair: [A, B]): [B, A] {
    const [a, b] = pair;
    return [b, a];
}

function minMax(values: number[]): [min: number, max: number] {
    return [Math.min(...values), Math.max(...values)];
}

let x = 1;
let y = 2;
[x, y] = [y, x];
console.log(x, y);

console.log(swap<string, number>(["one", 1]));

const [lo, hi] = minMax([4, 9, 2, 7]);
console.log(lo, hi);

const [first, , third = 0, ...rest] = [10, 20, undefined, 40, 50];
console.log(first, third, rest);
