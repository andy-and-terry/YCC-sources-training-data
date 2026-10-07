(def prices {:apple 1.5 :pear 2.0})

(defn describe [item]
  (if-let [p (prices item)]
    (str (name item) " costs " p)
    (str (name item) " is not for sale")))

(println (describe :apple))
(println (describe :kiwi))

(when-let [[a b] (seq [1 2 3])]
  (println "first two:" a b))

(println (when-some [v (get {:k false} :k)] (str "found " v)))  ; false is not nil
(println (if-some [v nil] "has" "nil"))
