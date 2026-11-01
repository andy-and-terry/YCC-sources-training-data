;; Leyland numbers: x^y + y^x for x >= y >= 2.
(defn ipow [b e] (reduce * 1N (repeat e b)))

(println
 (clojure.string/join " "
   (for [x (range 2 5) y (range 2 (inc x))]
     (+ (ipow x y) (ipow y x)))))
