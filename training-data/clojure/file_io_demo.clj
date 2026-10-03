(import 'java.io.File)

(def path "/tmp/clojure_file_io_demo.txt")

(spit path "line one\nline two\nline three\n")

(println "contents:")
(print (slurp path))

(println "lines:" (clojure.string/split-lines (slurp path)))

(.delete (File. path))
