(def jan {:apples 5 :pears 2 :kiwis 7})
(def feb {:apples 3 :plums 9 :kiwis 1})

;; combine values for keys present in both maps
(println (merge-with + jan feb))
(println (merge-with max jan feb))
(println (merge-with into {:a [1]} {:a [2 3] :b [4]}))

;; merge-with across many maps: total sales per product
(def sales [{:tea 3 :cake 1} {:tea 2} {:cake 4 :pie 1}])
(println (apply merge-with + sales))

;; plain merge: later maps win
(println (merge {:a 1 :b 2} {:b 3 :c 4}))

;; update with a function, and with extra args
(println (update {:count 1} :count + 10))
(println (update-vals {:a 1 :b 2} inc))
