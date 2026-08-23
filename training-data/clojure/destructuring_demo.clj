(defn describe-point [[x y]]
  (str "(" x ", " y ")"))

(let [{:keys [name age]} {:name "Ada" :age 30}]
  (println name age))

(println (describe-point [1 2]))

(let [[first-item & rest-items] [1 2 3 4]]
  (println first-item rest-items))
