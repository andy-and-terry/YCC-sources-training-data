;; volatile! is a cheap, non-atomic mutable box, handy inside transducers.
(defn running-total []
  (fn [rf]
    (let [total (volatile! 0)]
      (fn
        ([] (rf))
        ([result] (rf result))
        ([result x] (rf result (vswap! total + x)))))))

(println (into [] (running-total) [1 2 3 4 5]))

(def v (volatile! 10))
(vreset! v 20)
(vswap! v inc)
(println @v)
