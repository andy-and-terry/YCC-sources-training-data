(defn varint [n]
  (if (< n 128)
    [n]
    (into [(bit-or (bit-and n 127) 128)] (varint (bit-shift-right n 7)))))

(println (map #(format "%02x" %) (varint 300)))
