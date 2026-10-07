(defn make-bloom-filter [size]
  {:bits (atom (vec (repeat size false))) :size size})

(defn- hash1 [s size] (mod (reduce + (map int s)) size))
(defn- hash2 [s size] (mod (reduce + (map #(* 31 (int %)) s)) size))
(defn- hash3 [s size] (mod (reduce + (map-indexed (fn [i c] (* (inc i) (int c))) s)) size))

(defn bf-add! [bf s]
  (let [{:keys [bits size]} bf]
    (doseq [h [(hash1 s size) (hash2 s size) (hash3 s size)]]
      (swap! bits assoc h true))))

(defn bf-might-contain? [bf s]
  (let [{:keys [bits size]} bf]
    (every? #(@bits %) [(hash1 s size) (hash2 s size) (hash3 s size)])))

(def bf (make-bloom-filter 32))
(bf-add! bf "hello")
(bf-add! bf "world")
(println (bf-might-contain? bf "hello"))
(println (bf-might-contain? bf "world"))
(println (bf-might-contain? bf "missing"))
