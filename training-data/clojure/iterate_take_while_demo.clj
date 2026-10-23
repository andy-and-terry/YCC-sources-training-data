(def powers-of-two (iterate #(* 2 %) 1))

(println (take 10 powers-of-two))
(println (take-while #(< % 100) powers-of-two))
(println (drop-while #(< % 100) (take 10 powers-of-two)))
(println (first (filter #(> % 1000) powers-of-two)))
(println (take 5 (iterate (fn [[a b]] [b (+ a b)]) [0 1])))
