(let [[a b & rest] [1 2 3 4 5]]
  (println a b rest))

(let [[x y :as all] [10 20 30]]
  (println x y all))

(let [[_ _ third] "abc"]
  (println third))

(defn head-tail [[h & t]] {:head h :tail t})
(println (head-tail [9 8 7]))
