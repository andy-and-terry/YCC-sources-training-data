(defn gcd [a b] (if (zero? b) a (recur b (mod a b))))

(defn rho [n]
  (let [f #(mod (+ (* % %) 1) n)]
    (loop [x 2 y 2]
      (let [x (f x) y (f (f y)) d (gcd (Math/abs (- x y)) n)]
        (if (= d 1) (recur x y) d)))))

(let [n 8051 p (rho n)]
  (println n "=" p "*" (quot n p)))
