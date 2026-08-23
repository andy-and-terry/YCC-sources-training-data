(defn sum-all [& nums]
  (apply + nums))

(println (sum-all 1 2 3))
(println (apply sum-all [1 2 3 4 5]))
