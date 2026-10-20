(let [[a b & rest] [1 2 3 4 5]
      {:keys [name age] :or {age 0}} {:name "Ada"}
      {x :x {y :y} :inner} {:x 1 :inner {:y 2}}
      [[p q] r] [[1 2] 3]]
  (println a b rest name age x y p q r))

(defn greet [{:keys [first last] :as person}]
  (str first " " last " " (count person)))
(println (greet {:first "Ada" :last "L"}))
(doseq [[k v] {:a 1 :b 2}] (println k v))
