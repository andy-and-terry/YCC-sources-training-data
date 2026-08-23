(defn cb-add [{:keys [buffer capacity head size] :as cb} value]
  (let [tail (mod (+ head size) capacity)
        new-buffer (assoc buffer tail value)]
    (if (< size capacity)
      (assoc cb :buffer new-buffer :size (inc size))
      (assoc cb :buffer new-buffer :head (mod (inc head) capacity)))))

(defn cb-to-list [{:keys [buffer head size capacity]}]
  (map #(nth buffer (mod (+ head %) capacity)) (range size)))

(def cb0 {:buffer (vec (repeat 3 nil)) :capacity 3 :head 0 :size 0})
(def final-cb (reduce cb-add cb0 [1 2 3 4 5]))
(println (cb-to-list final-cb))
