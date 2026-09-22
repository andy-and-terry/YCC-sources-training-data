(defn make-cache [capacity]
  (atom {:capacity capacity :order [] :data {}}))

(defn cache-get [cache key]
  (let [{:keys [data order]} @cache]
    (if (contains? data key)
      (do
        (swap! cache assoc :order (conj (vec (remove #(= % key) order)) key))
        (get data key))
      :miss)))

(defn cache-put! [cache key val]
  (swap! cache
         (fn [{:keys [capacity order data] :as state}]
           (let [order (conj (vec (remove #(= % key) order)) key)
                 data (assoc data key val)]
             (if (> (count order) capacity)
               (let [evict (first order)]
                 {:capacity capacity
                  :order (vec (rest order))
                  :data (dissoc data evict)})
               {:capacity capacity :order order :data data})))))

(def c (make-cache 2))
(cache-put! c :a 1)
(cache-put! c :b 2)
(println (cache-get c :a))
(cache-put! c :c 3)
(println (cache-get c :b))
(println (cache-get c :a))
(println (cache-get c :c))
