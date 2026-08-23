proc genericMax[T](a, b: T): T =
  if a > b: a else: b

echo genericMax(3, 7)
echo genericMax(2.5, 1.5)
echo genericMax("apple", "banana")
