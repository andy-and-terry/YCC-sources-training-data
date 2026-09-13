(def prices {:apple 2 :banana 1 :cherry 5})

(def total (reduce-kv (fn [acc _ price] (+ acc price)) 0 prices))

(def labeled (reduce-kv (fn [acc k v] (conj acc (str (name k) "=" v))) [] prices))

(println total)
(println labeled)
