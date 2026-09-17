(def counter (agent 0))

(defn slow-increment [n]
  (Thread/sleep 10)
  (inc n))

(send counter slow-increment)
(send counter slow-increment)
(send counter inc)

(await counter)
(println "final value:" @counter)
