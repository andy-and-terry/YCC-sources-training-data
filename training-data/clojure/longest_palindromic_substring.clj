(defn palindrome? [s]
  (= s (clojure.string/reverse s)))

(defn longest-palindromic-substring [s]
  (let [n (count s)
        substrs (for [i (range n)
                      j (range (inc i) (inc n))]
                  (subs s i j))]
    (apply max-key count (filter palindrome? substrs))))

(println (longest-palindromic-substring "babad"))
(println (longest-palindromic-substring "cbbd"))
