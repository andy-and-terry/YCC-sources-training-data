;; with-redefs temporarily replaces a var's root binding (handy for testing)
(defn fetch-price [item]
  (println "calling the real service for" item)
  (case item
    :apple 1.25
    :pear 2.0
    0.0))

(defn total-cost [items]
  (reduce + (map fetch-price items)))

(println "real:" (total-cost [:apple :pear]))

(with-redefs [fetch-price (fn [_] 10)]
  (println "stubbed:" (total-cost [:apple :pear :kiwi])))

;; the original definition is restored afterwards
(println "restored:" (total-cost [:apple]))

;; redefine with a function that records calls
(def calls (atom []))
(with-redefs [fetch-price (fn [item] (swap! calls conj item) 1)]
  (total-cost [:a :b :c]))
(println "recorded calls:" @calls)

;; also works for core functions used by your own code
(with-redefs [rand-int (constantly 4)]
  (println (repeatedly 3 #(rand-int 100))))
