T largest<T extends Comparable<T>>(List<T> xs) =>
    xs.reduce((a, b) => a.compareTo(b) >= 0 ? a : b);

void main() {
  print(largest([3, 9, 2]));
  print(largest(['pear', 'apple']));
}
