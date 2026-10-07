(import 'clojure.lang.PersistentQueue)

(def empty-queue PersistentQueue/EMPTY)

(def q (into empty-queue [1 2 3 4]))

(println "peek:" (peek q))
(println "queue:" (seq q))

(def q2 (pop q))
(println "after pop:" (seq q2))
(println "peek after pop:" (peek q2))
