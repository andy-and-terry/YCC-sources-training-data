(def account-a (ref 100))
(def account-b (ref 50))

(defn transfer! [from to amount]
  (dosync
    (alter from - amount)
    (alter to + amount)))

(transfer! account-a account-b 30)
(println @account-a @account-b)
