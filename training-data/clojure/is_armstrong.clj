(defn armstrong? [n]
  (let [digits (map #(Character/getNumericValue %) (str n))
        power (count digits)]
    (= n (reduce + (map #(int (Math/pow % power)) digits)))))

(println (armstrong? 153))
(println (armstrong? 123))
