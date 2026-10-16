(require '[clojure.string :as str])

(def csv "name,age,city")
(println (str/split csv #","))
(println (str/join " | " (str/split csv #",")))
(println (str/split "a1b22c333" #"\d+"))
(println (str/split-lines "line one\nline two\nline three"))
(println (str/join (reverse "stressed")))
