(let [{:keys [name] {:keys [city]} :addr [a b & more] :tags}
      {:name "Ann" :addr {:city "NYC"} :tags [:x :y :z :w]}]
  (println name city a b more))
