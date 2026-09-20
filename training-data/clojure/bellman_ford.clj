(def edges [[:a :b 6] [:a :d 7] [:b :c 5] [:b :d 8] [:b :e -4]
            [:c :b -2] [:d :c -3] [:d :e 9] [:e :a 2] [:e :c 7]])
(def vertices [:a :b :c :d :e])
(def inf Integer/MAX_VALUE)

(defn relax-edges [dist edges]
  (reduce
   (fn [d [u v w]]
     (let [du (get d u inf)]
       (if (and (not= du inf) (< (+ du w) (get d v inf)))
         (assoc d v (+ du w))
         d)))
   dist
   edges))

(defn bellman-ford [vertices edges start]
  (let [initial (assoc (zipmap vertices (repeat inf)) start 0)
        final-dist (nth (iterate #(relax-edges % edges) initial) (dec (count vertices)))
        one-more (relax-edges final-dist edges)]
    (if (= one-more final-dist)
      final-dist
      :negative-cycle)))

(println (bellman-ford vertices edges :a))
