(defn tarjan-scc [graph]
  (let [state (atom {:index 0 :ids {} :low {} :on-stack #{} :stack [] :result []})]
    (letfn [(dfs [v]
              (swap! state (fn [s]
                              (-> s
                                  (assoc-in [:ids v] (:index s))
                                  (assoc-in [:low v] (:index s))
                                  (update :index inc)
                                  (update :stack conj v)
                                  (update :on-stack conj v))))
              (doseq [w (graph v)]
                (if (not (contains? (:ids @state) w))
                  (do (dfs w)
                      (swap! state update-in [:low v] min (get-in @state [:low w])))
                  (when (contains? (:on-stack @state) w)
                    (swap! state update-in [:low v] min (get-in @state [:ids w])))))
              (when (= (get-in @state [:ids v]) (get-in @state [:low v]))
                (let [[component new-stack]
                      (loop [stack (:stack @state) comp []]
                        (let [top (peek stack)]
                          (if (= top v)
                            [(conj comp top) (pop stack)]
                            (recur (pop stack) (conj comp top)))))]
                  (swap! state (fn [s]
                                  (-> s
                                      (assoc :stack new-stack)
                                      (update :on-stack #(apply disj % component))
                                      (update :result conj component)))))))]
      (doseq [v (keys graph)]
        (when (not (contains? (:ids @state) v))
          (dfs v)))
      (:result @state))))

(def graph {0 [1] 1 [2] 2 [0 3] 3 [4] 4 [5] 5 [3] 6 [5 7] 7 []})

(println (tarjan-scc graph))
