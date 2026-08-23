(defn max-subarray [nums]
  (loop [nums (rest nums)
         max-so-far (first nums)
         max-ending-here (first nums)]
    (if (empty? nums)
      max-so-far
      (let [x (first nums)
            new-ending (max x (+ max-ending-here x))]
        (recur (rest nums) (max max-so-far new-ending) new-ending)))))

(println (max-subarray [-2 1 -3 4 -1 2 1 -5 4]))
