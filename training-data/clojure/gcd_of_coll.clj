(defn gcd [a b] (if (zero? b) (Math/abs a) (recur b (mod a b))))

(defn gcd-all [& nums] (reduce gcd 0 nums))

(println (gcd-all 12 18 24))
(println (gcd-all 7 13))
