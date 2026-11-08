(defun crc8 (str)
  (let ((crc 0))
    (loop for ch across str
          do (setf crc (logxor crc (char-code ch)))
             (dotimes (i 8)
               (setf crc (if (zerop (logand crc #x80))
                             (logand (ash crc 1) #xFF)
                             (logand (logxor (ash crc 1) #x07) #xFF)))))
    crc))

(format t "~(~2,'0x~)~%" (crc8 "123456789"))
