(defn add-binary [a b]
  (let [n (max (count a) (count b))
        pad #(concat (repeat (- n (count %)) \0) %)
        digit #(Character/digit ^char % 10)
        pairs (reverse (map vector (pad a) (pad b)))
        [carry bits] (reduce (fn [[c acc] [x y]]
                               (let [s (+ (digit x) (digit y) c)]
                                 [(quot s 2) (cons (rem s 2) acc)]))
                             [0 '()]
                             pairs)]
    (apply str (if (pos? carry) (cons 1 bits) bits))))

(println (add-binary "1010" "1011")) ; 10101
