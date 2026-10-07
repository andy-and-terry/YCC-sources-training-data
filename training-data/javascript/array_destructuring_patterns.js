const [first, second, ...rest] = [1, 2, 3, 4, 5];
console.log(first, second, rest);

const [a = 10, b = 20] = [undefined, 5];
console.log(a, b);

const [, , third] = ['x', 'y', 'z'];
console.log(third);

function distance([x1, y1], [x2, y2]) {
  return Math.hypot(x2 - x1, y2 - y1);
}
console.log(distance([0, 0], [3, 4]));

const [{ name }, { name: otherName }] = [{ name: 'Ada' }, { name: 'Lin' }];
console.log(name, otherName);

const swap = ([x, y]) => [y, x];
console.log(swap([1, 2]));
