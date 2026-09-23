(defn- egcd [a b]
  (if (zero? b)
    [a 1 0]
    (let [[g x1 y1] (egcd b (mod a b))]
      [g y1 (- x1 (* (quot a b) y1))])))

;; Combines two congruences x = r1 (mod m1), x = r2 (mod m2) into one
;; x = r (mod lcm(m1, m2)), assuming m1 and m2 are coprime.
(defn- crt-pair [r1 m1 r2 m2]
  (let [[g p _q] (egcd m1 m2)
        lcm (* (quot m1 g) m2)
        diff (- r2 r1)
        tmp (mod (* (quot diff g) p) (quot m2 g))
        x (mod (+ r1 (* m1 tmp)) lcm)]
    [x lcm]))

(defn crt [remainders moduli]
  (first
    (reduce (fn [[r m] [r2 m2]] (crt-pair r m r2 m2))
            [(first remainders) (first moduli)]
            (map vector (rest remainders) (rest moduli)))))

(println (crt [2 3 2] [3 5 7]))
