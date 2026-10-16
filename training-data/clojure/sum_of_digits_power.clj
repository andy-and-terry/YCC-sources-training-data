(defn digits [n] (map #(Character/digit % 10) (str n)))

(defn digit-power-sum [n p] (reduce + (map #(long (Math/pow % p)) (digits n))))

(println (digits 9475))
(println (digit-power-sum 9474 4))
(println (filter #(= % (digit-power-sum % 4)) (range 1000 10000)))
