;; n is triangular iff 8n + 1 is a perfect square.
(defn triangular? [n]
  (let [s (+ (* 8 n) 1)
        r (long (Math/round (Math/sqrt s)))]
    (= (* r r) s)))

(println (clojure.string/join " " (filter triangular? (range 0 21))))
