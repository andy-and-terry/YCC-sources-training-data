(def state {:user {:name "Ada" :score 10}
            :counts {:wins 0 :losses 0}})

(def after-win
  (-> state
      (update-in [:user :score] + 5)
      (update-in [:counts :wins] inc)))

(def after-loss
  (update-in after-win [:counts :losses] inc))

(println state)
(println after-win)
(println after-loss)
