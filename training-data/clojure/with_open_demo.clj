(import 'java.io.StringWriter)

(defn write-lines [writer lines]
  (doseq [line lines]
    (.write writer line)
    (.write writer "\n")))

(with-open [w (StringWriter.)]
  (write-lines w ["first" "second" "third"])
  (println (.toString w)))
