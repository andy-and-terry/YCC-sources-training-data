;; reduced short-circuits a reduce; transduce honors it too

(defn first-over
  "Running sum of xs, stopping as soon as it exceeds limit."
  [limit xs]
  (reduce (fn [acc x]
            (let [total (+ acc x)]
              (if (> total limit)
                (reduced total)
                total)))
          0
          xs))

(println "stopped at total:" (first-over 20 (range 1 100)))
(println "never exceeded:" (first-over 1000 [1 2 3]))

;; Works on infinite sequences because the reduction stops early
(defn find-first [pred coll]
  (reduce (fn [_ x] (when (pred x) (reduced x))) nil coll))

(println "first square > 500:" (find-first #(> % 500) (map #(* % %) (range))))

;; Inside a transducer pipeline
(def xf (comp (map inc) (filter even?)))
(println "sum of first 3 evens:"
         (transduce (comp xf (take 3)) + 0 (range)))

;; reduced? and unreduced
(let [r (reduced :done)]
  (println "reduced?" (reduced? r) "value:" @r))
