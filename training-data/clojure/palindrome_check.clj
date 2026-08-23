(defn palindrome? [s]
  (= (seq s) (reverse (seq s))))

(println (palindrome? "racecar"))
(println (palindrome? "hello"))
