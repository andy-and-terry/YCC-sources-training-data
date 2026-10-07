(println (merge {:a 1 :b 2} {:b 3 :c 4}))          ; right wins
(println (merge-with + {:a 1 :b 2} {:b 3 :c 4}))   ; combine collisions
(println (merge-with into {:x [1]} {:x [2] :y [3]}))

;; aggregate sales by region
(def sales [{:east 10 :west 5} {:east 7} {:west 3 :north 1}])
(println (apply merge-with + sales))

(println (zipmap [:a :b :c] [1 2 3]))
(println (select-keys {:a 1 :b 2 :c 3} [:a :c]))
