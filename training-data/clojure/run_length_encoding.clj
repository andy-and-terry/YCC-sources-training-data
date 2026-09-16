(defn run-length-encode [s]
  (->> (partition-by identity s)
       (map (fn [run] (str (count run) (first run))))
       (apply str)))

(println (run-length-encode "aaabbbcca"))
(println (run-length-encode "wwwwaaadexxxxxx"))
