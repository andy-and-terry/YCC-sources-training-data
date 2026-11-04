(defn merge-sorted [a b]
  (lazy-seq
    (let [x (first a) y (first b)]
      (cond (< x y) (cons x (merge-sorted (rest a) b))
            (> x y) (cons y (merge-sorted a (rest b)))
            :else   (cons x (merge-sorted (rest a) (rest b)))))))

(def ugly
  (letfn [(build [] (lazy-seq (cons 1 (merge-sorted (map #(* 2 %) (build))
                                                    (merge-sorted (map #(* 3 %) (build))
                                                                  (map #(* 5 %) (build)))))))]
    (build)))

(println (take 12 ugly))
