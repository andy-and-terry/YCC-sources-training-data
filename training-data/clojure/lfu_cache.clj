(defn make-lfu [capacity]
  (atom {:capacity capacity :store {} :freq {}}))

(defn lfu-get [lfu key]
  (let [{:keys [store]} @lfu]
    (when (contains? store key)
      (swap! lfu update :freq update key (fnil inc 0))
      (get store key))))

(defn lfu-put! [lfu key value]
  (swap! lfu
    (fn [{:keys [capacity store freq] :as state}]
      (cond
        (contains? store key)
        (-> state
            (assoc-in [:store key] value)
            (update-in [:freq key] (fnil inc 0)))

        (< (count store) capacity)
        (-> state
            (assoc-in [:store key] value)
            (assoc-in [:freq key] 1))

        :else
        (let [evict (first (apply min-key val freq))]
          (-> state
              (update :store dissoc evict)
              (update :freq dissoc evict)
              (assoc-in [:store key] value)
              (assoc-in [:freq key] 1)))))))

(def cache (make-lfu 2))
(lfu-put! cache :a 1)
(lfu-put! cache :b 2)
(println (lfu-get cache :a))
(lfu-put! cache :c 3)     ; evicts :b, the least frequently used
(println (lfu-get cache :b))
(println (lfu-get cache :c))
