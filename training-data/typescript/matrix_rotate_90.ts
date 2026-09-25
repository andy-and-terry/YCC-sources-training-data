export type Matrix<T> = T[][];

export const transpose = <T>(m: Matrix<T>): Matrix<T> => m[0].map((_, c) => m.map((row) => row[c]));
export const rotateCW = <T>(m: Matrix<T>): Matrix<T> => transpose(m).map((row) => row.reverse());
export const rotateCCW = <T>(m: Matrix<T>): Matrix<T> => transpose(m).reverse();
export const rotate180 = <T>(m: Matrix<T>): Matrix<T> => m.map((row) => [...row].reverse()).reverse();

const m = [[1, 2, 3], [4, 5, 6]];
console.log(rotateCW(m), rotateCCW(m), rotate180(m));
console.log(JSON.stringify(rotateCW(rotateCW(rotateCW(rotateCW(m))))) === JSON.stringify(m));
