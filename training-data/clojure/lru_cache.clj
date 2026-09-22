(defn make-lru [capacity]
  (atom {:capacity capacity :order [] :store {}}))

(defn lru-get [lru key]
  (let [{:keys [store order]} @lru]
    (if (contains? store key)
      (do
        (swap! lru assoc :order (conj (vec (remove #(= % key) order)) key))
        (get store key))
      nil)))

(defn lru-put! [lru key value]
  (swap! lru
         (fn [{:keys [capacity order store]}]
           (let [order (conj (vec (remove #(= % key) order)) key)
                 store (assoc store key value)]
             (if (> (count order) capacity)
               (let [evict (first order)]
                 {:capacity capacity
                  :order (vec (rest order))
                  :store (dissoc store evict)})
               {:capacity capacity :order order :store store})))))

(def cache (make-lru 2))
(lru-put! cache :a 1)
(lru-put! cache :b 2)
(println (lru-get cache :a))
(lru-put! cache :c 3)
(println (lru-get cache :b))
(println (lru-get cache :a))
(println (lru-get cache :c))
