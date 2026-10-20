(let [{:keys [name] [x y] :pos :or {name "anon"}} {:pos [3 4]}]
  (println name (+ x y)))
(defn f [a & [b c]] [a b c])
(println (f 1 2))
