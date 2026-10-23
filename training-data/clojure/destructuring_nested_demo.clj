(def data {:user {:name "Ada" :langs ["clj" "rkt" "scm"]}})

(let [{{:keys [name] [first-lang & more] :langs} :user} data]
  (println name first-lang more))

(defn point-sum [[x y] {:keys [dx dy] :or {dx 0 dy 0}}]
  [(+ x dx) (+ y dy)])

(println (point-sum [1 2] {:dx 5}))
