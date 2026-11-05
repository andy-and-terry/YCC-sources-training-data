(let [{:keys [name] {:keys [city zip]} :address} {:name "Ann" :address {:city "Oslo" :zip "0150"}}
      [a b & more] [1 2 3 4 5]]
  (println name city zip)
  (println a b more))
