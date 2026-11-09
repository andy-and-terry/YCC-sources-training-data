(require '[clojure.core.async :as a])
(let [c (a/chan)]
  (a/go (a/>! c "hello from go block"))
  (println (a/<!! c)))
