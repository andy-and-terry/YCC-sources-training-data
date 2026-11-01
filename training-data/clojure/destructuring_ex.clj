(defn show [{:keys [name age] :or {age 0}} [first-item & rest-items]]
  (println name age first-item rest-items))

(show {:name "ann"} [1 2 3])
(let [[a [b c]] [1 [2 3]]
      {:strs [x]} {"x" 10}]
  (println a b c x))
