(defn slow-square [n]
  (Thread/sleep 100)
  (* n n))

(let [t0 (System/nanoTime)
      r  (doall (map slow-square (range 8)))
      t1 (System/nanoTime)
      p  (doall (pmap slow-square (range 8)))
      t2 (System/nanoTime)]
  (println r (= r p))
  (println "map  ms:" (quot (- t1 t0) 1000000))
  (println "pmap ms:" (quot (- t2 t1) 1000000)))

(shutdown-agents)
