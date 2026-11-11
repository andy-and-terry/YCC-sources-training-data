;; Perrin sequence P(n)=P(n-2)+P(n-3)
(def seq-vals
  (let [step (fn [v] (conj v (+ (v (- (count v) 2)) (v (- (count v) 3)))))]
    (nth (iterate step [3 0 2]) 7)))

(println seq-vals)
