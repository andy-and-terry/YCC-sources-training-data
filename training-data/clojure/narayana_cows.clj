;; Narayana's cows N(n)=N(n-1)+N(n-3)
(def seq-vals
  (let [step (fn [v] (conj v (+ (v (- (count v) 1)) (v (- (count v) 3)))))]
    (nth (iterate step [1 1 1]) 7)))

(println seq-vals)
