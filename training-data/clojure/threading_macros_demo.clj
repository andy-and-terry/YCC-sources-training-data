(def numbers (range 1 11))

(def result
  (->> numbers
       (filter even?)
       (map #(* % %))
       (reduce +)))

(println result)

(def person {:name "Ada" :address {:city "Berlin"}})
(println (-> person :address :city))
