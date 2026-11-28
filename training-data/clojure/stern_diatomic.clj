(defn stern [count]
  (reduce (fn [seq i]
            (let [h (quot i 2)]
              (conj seq (if (even? i) (seq h) (+ (seq h) (seq (inc h)))))))
          [0 1]
          (range 2 count)))

(println (stern 15)) ; [0 1 1 2 1 3 2 3 1 4 3 5 2 5 3]
