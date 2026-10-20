class Id {
  private static n = 0;
  private constructor(readonly v: number) {}
  static next() { return new Id(++Id.n); }
}
console.log(Id.next().v, Id.next().v);
