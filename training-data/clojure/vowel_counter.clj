(defn count-vowels [s]
  (into (sorted-map)
        (frequencies (filter #{\a \e \i \o \u} (.toLowerCase ^String s)))))

(println (count-vowels "Education is beautiful"))
