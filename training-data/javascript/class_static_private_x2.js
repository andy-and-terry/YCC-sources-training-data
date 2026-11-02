class IdGen {
  static #next = 1;
  static next() { return IdGen.#next++; }
}
console.log(IdGen.next(), IdGen.next());
