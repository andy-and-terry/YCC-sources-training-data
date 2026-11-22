;; Euler zigzag numbers via the Seidel-Entringer boustrophedon.
(defn step [row]
  (reductions + 0 (reverse row)))

(println (clojure.string/join " " (map last (take 10 (iterate step [1])))))
