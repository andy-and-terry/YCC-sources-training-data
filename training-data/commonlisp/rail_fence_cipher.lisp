(defun rail (i k)
  (let* ((cycle (* 2 (1- k))) (r (mod i cycle)))
    (if (< r k) r (- cycle r))))

(defun order (n k)
  (stable-sort (loop for i below n collect i) #'< :key (lambda (i) (rail i k))))

(defun encrypt (text k)
  (map 'string (lambda (i) (char text i)) (order (length text) k)))

(defun decrypt (cipher k)
  (let ((out (make-string (length cipher))))
    (loop for i in (order (length cipher) k)
          for pos from 0
          do (setf (char out i) (char cipher pos)))
    out))

(let ((c (encrypt "WEAREDISCOVERED" 3)))
  (format t "~a ~a~%" c (decrypt c 3)))
