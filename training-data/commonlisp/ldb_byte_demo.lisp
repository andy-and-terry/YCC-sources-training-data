(let ((x #b11010110))
  (format t "~b~%" (ldb (byte 4 0) x))
  (format t "~b~%" (ldb (byte 4 4) x))
  (format t "~b~%" (dpb #b1111 (byte 4 0) x))
  (format t "~a~%" (ldb-test (byte 1 2) x))
  (format t "~a~%" (logbitp 7 x))
  (format t "~a~%" (integer-length x)))

(defun rgb-pack (r g b)
  (dpb r (byte 8 16) (dpb g (byte 8 8) b)))

(let ((c (rgb-pack 255 128 7)))
  (format t "#x~6,'0x~%" c)
  (format t "~a ~a ~a~%" (ldb (byte 8 16) c) (ldb (byte 8 8) c) (ldb (byte 8 0) c)))
