(defn lis-length [xs]
  (count
   (reduce (fn [tails x]
             (let [i (count (take-while #(< % x) tails))]
               (if (= i (count tails))
                 (conj tails x)
                 (assoc tails i x))))
           [] xs)))

(println (lis-length [10 9 2 5 3 7 101 18]))
