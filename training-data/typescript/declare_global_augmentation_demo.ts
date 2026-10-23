export {};

declare global {
  interface Array<T> {
    last(): T | undefined;
  }
  interface String {
    capitalize(): string;
  }
  var appVersion: string;
}

Array.prototype.last = function <T>(this: T[]): T | undefined {
  return this[this.length - 1];
};

String.prototype.capitalize = function (this: string): string {
  return this.charAt(0).toUpperCase() + this.slice(1);
};

globalThis.appVersion = "1.2.3";

console.log([1, 2, 3].last());
console.log([].last());
console.log("hello world".capitalize());
console.log(appVersion);
