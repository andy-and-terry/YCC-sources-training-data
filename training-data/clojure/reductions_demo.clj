(def xs [3 1 4 1 5 9 2 6])

;; running totals
(println (reductions + xs))

;; with an initial value
(println (reductions + 100 xs))

;; running maximum
(println (reductions max xs))

;; compound interest, year by year
(println (take 5 (reductions (fn [bal _] (* bal 1.05)) 1000.0 (range))))

;; the final element of reductions equals reduce
(println (= (last (reductions * (range 1 6))) (reduce * (range 1 6))))

;; first n triangular numbers via lazy reductions
(println (take 8 (reductions + (iterate inc 1))))

;; stop early using reduced
(println (reduce (fn [acc x] (if (> acc 10) (reduced acc) (+ acc x))) (range 100)))
