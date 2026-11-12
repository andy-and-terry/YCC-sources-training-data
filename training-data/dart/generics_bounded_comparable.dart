T maxOf<T extends Comparable<T>>(List<T> xs) => xs.reduce((a, b) => a.compareTo(b) >= 0 ? a : b);
void main() {
  print(maxOf([3, 9, 4]));
  print(maxOf(['pear', 'zebra']));
}
