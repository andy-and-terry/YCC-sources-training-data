(defn prime? [n]
  (and (>= n 2) (not-any? #(zero? (mod n %)) (take-while #(<= (* % %) n) (iterate inc 2)))))

(defn rev-num [n] (Long/parseLong (apply str (reverse (str n)))))

(def emirps
  (filter (fn [n] (let [r (rev-num n)] (and (not= r n) (prime? n) (prime? r)))) (iterate inc 2)))

(println (take 10 emirps)) ; (13 17 31 37 71 73 79 97 107 113)
