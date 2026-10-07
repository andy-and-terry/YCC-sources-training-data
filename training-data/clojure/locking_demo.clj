(def counter (atom 0))
(def lock-obj (Object.))

(defn safe-increment! [n]
  (locking lock-obj
    (dotimes [_ n]
      (swap! counter inc))))

(def threads (mapv (fn [_] (Thread. (fn [] (safe-increment! 1000)))) (range 4)))

(doseq [t threads] (.start t))
(doseq [t threads] (.join t))

(println "final count:" @counter)
