(defn slow-square [n]
  (Thread/sleep 50)
  (* n n))

(def f (future (slow-square 6)))

(def p (promise))

(future (deliver p (+ 1 2 3)))

(println "future result:" @f)
(println "promise result:" @p)
