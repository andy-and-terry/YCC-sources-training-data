(defn mod-inverse [a m] (first (filter #(= 1 (mod (* a %) m)) (range 1 m))))

(defn affine [s a b decrypt?]
  (let [inv (mod-inverse a 26)]
    (apply str
           (for [ch s]
             (let [x (- (int ch) 65)
                   y (if decrypt? (mod (* inv (- x b)) 26) (mod (+ (* a x) b) 26))]
               (char (+ y 65)))))))

(let [c (affine "AFFINE" 5 8 false)]
  (println c (affine c 5 8 true)))
