(require '[clojure.core.async :as a])
(let [c (a/chan 3)]
  (a/go (doseq [i (range 3)] (a/>! c i)) (a/close! c))
  (println (a/<!! (a/into [] c))))
