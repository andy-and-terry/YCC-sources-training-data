(require '[clojure.test :refer [deftest is testing are run-tests]])

(defn fizzbuzz [n]
  (cond
    (zero? (mod n 15)) "FizzBuzz"
    (zero? (mod n 3)) "Fizz"
    (zero? (mod n 5)) "Buzz"
    :else (str n)))

(defn safe-div [a b]
  (when (zero? b)
    (throw (ArithmeticException. "divide by zero")))
  (/ a b))

(deftest fizzbuzz-test
  (testing "multiples"
    (is (= "Fizz" (fizzbuzz 9)))
    (is (= "Buzz" (fizzbuzz 10)))
    (is (= "FizzBuzz" (fizzbuzz 30))))
  (testing "plain numbers"
    (are [n expected] (= expected (fizzbuzz n))
      1 "1"
      2 "2"
      7 "7")))

(deftest safe-div-test
  (is (= 5 (safe-div 10 2)))
  (is (thrown? ArithmeticException (safe-div 1 0)))
  (is (thrown-with-msg? ArithmeticException #"zero" (safe-div 1 0))))

(run-tests)
