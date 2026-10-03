(def numbers (range 1 11))

(println "partition 3:" (partition 3 numbers))
(println "partition 3 step 1:" (partition 3 1 numbers))
(println "partition-all 3:" (partition-all 3 numbers))
(println "partition-by even?:" (partition-by even? numbers))
