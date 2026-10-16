typedef Predicate<T> = bool Function(T value);
typedef Transform<A, B> = B Function(A input);

List<T> keep<T>(List<T> xs, Predicate<T> p) => xs.where(p).toList();
List<B> mapAll<A, B>(List<A> xs, Transform<A, B> f) => xs.map(f).toList();

void main() {
  print(keep([1, 2, 3, 4], (n) => n > 2));
  print(mapAll(['a', 'bb'], (s) => s.length));
}
