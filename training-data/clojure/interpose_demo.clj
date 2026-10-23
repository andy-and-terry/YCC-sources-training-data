(require '[clojure.string :as str])

;; interpose puts a separator between elements of a collection.
(println (interpose ", " ["a" "b" "c"]))
(println (apply str (interpose ", " ["a" "b" "c"])))
(println (str/join ", " ["a" "b" "c"]))

;; interpose with a number separator, then reduce.
(println (reduce + (interpose 100 [1 2 3])))

;; Wrapping each element and interposing builds a simple formatter.
(defn csv-row [cells]
  (->> cells
       (map #(str "\"" % "\""))
       (interpose ",")
       (apply str)))

(println (csv-row ["name" "age" "city"]))

;; interpose is lazy and also works as a transducer.
(println (into [] (interpose :sep) [1 2 3]))
(println (first (interpose 0 (range))))

;; interleave pairs two sequences, interpose repeats one value.
(println (interleave [:a :b :c] [1 2 3]))
