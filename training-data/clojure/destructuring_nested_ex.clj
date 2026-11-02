(let [{:keys [name] {:keys [city]} :address [a b & more] :tags}
      {:name "Ann" :address {:city "Oslo"} :tags [1 2 3 4]}]
  (println name city a b more))
