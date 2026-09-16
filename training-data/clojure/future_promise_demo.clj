(defn slow-square [n]
  (Thread/sleep 50)
  (* n n))

(def results (mapv #(future (slow-square %)) (range 1 6)))
(println (mapv deref results))

(def p (promise))
(future (Thread/sleep 20) (deliver p :done))
(println @p)
