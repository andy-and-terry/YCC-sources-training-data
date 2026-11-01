;; Positive n expressible as a*a + b*b with a, b >= 0.
(defn representable? [n]
  (boolean
   (some (fn [a]
           (let [b (long (Math/round (Math/sqrt (- n (* a a)))))]
             (= n (+ (* a a) (* b b)))))
         (take-while #(<= (* % %) n) (range)))))

(println (clojure.string/join " " (filter representable? (range 1 31))))
