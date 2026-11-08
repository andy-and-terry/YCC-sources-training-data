(defun varint (n)
  (if (< n 128)
      (list n)
      (cons (logior (logand n 127) 128) (varint (ash n -7)))))

(format t "~{~(~2,'0x~)~^ ~}~%" (varint 300))
