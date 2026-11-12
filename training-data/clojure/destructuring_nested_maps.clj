(let [{:keys [name] {:keys [city]} :addr [a b & more] :tags} {:name "Ann" :addr {:city "Oslo"} :tags [1 2 3 4]}]
  (println name city a b more))
