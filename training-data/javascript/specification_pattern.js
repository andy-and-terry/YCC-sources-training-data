class Specification {
  constructor(predicate) {
    this.predicate = predicate;
  }
  isSatisfiedBy(candidate) {
    return this.predicate(candidate);
  }
  and(other) {
    return new Specification((c) => this.isSatisfiedBy(c) && other.isSatisfiedBy(c));
  }
  or(other) {
    return new Specification((c) => this.isSatisfiedBy(c) || other.isSatisfiedBy(c));
  }
  not() {
    return new Specification((c) => !this.isSatisfiedBy(c));
  }
}

const isAdult = new Specification((p) => p.age >= 18);
const isVerified = new Specification((p) => p.verified);
const canCheckout = isAdult.and(isVerified);
const needsReview = canCheckout.not();

const people = [
  { name: 'Ann', age: 25, verified: true },
  { name: 'Bo', age: 16, verified: true },
  { name: 'Cy', age: 30, verified: false },
];

console.log(people.filter((p) => canCheckout.isSatisfiedBy(p)).map((p) => p.name));
console.log(people.filter((p) => needsReview.isSatisfiedBy(p)).map((p) => p.name));
console.log(people.filter((p) => isAdult.or(isVerified).isSatisfiedBy(p)).map((p) => p.name));

module.exports = { Specification };
