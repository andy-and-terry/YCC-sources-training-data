(defn push-min [stack x]
  (conj stack [x (if (seq stack) (min x (second (peek stack))) x)]))

(def s (reduce push-min '() [5 3 7 2]))

(println (second (peek s)))
(println (second (peek (pop s))))
