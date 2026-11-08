(defn crc8 [bs]
  (reduce
   (fn [crc b]
     (reduce (fn [c _]
               (if (zero? (bit-and c 0x80))
                 (bit-and (bit-shift-left c 1) 0xFF)
                 (bit-and (bit-xor (bit-shift-left c 1) 0x07) 0xFF)))
             (bit-xor crc b)
             (range 8)))
   0 bs))

(println (format "%02x" (crc8 (map int "123456789"))))
