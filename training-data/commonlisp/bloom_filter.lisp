(defparameter *bloom-size* 32)
(defparameter *bloom-bits* (make-array *bloom-size* :initial-element nil))

(defun bloom-hash1 (s)
  (mod (reduce #'+ (map 'list #'char-code s)) *bloom-size*))

(defun bloom-hash2 (s)
  (mod (reduce #'+ (map 'list (lambda (c) (* 31 (char-code c))) s)) *bloom-size*))

(defun bloom-hash3 (s)
  (mod (loop for c across s for i from 1 sum (* i (char-code c))) *bloom-size*))

(defun bloom-add (s)
  (setf (aref *bloom-bits* (bloom-hash1 s)) t)
  (setf (aref *bloom-bits* (bloom-hash2 s)) t)
  (setf (aref *bloom-bits* (bloom-hash3 s)) t))

(defun bloom-might-contain-p (s)
  (and (aref *bloom-bits* (bloom-hash1 s))
       (aref *bloom-bits* (bloom-hash2 s))
       (aref *bloom-bits* (bloom-hash3 s))))

(bloom-add "hello")
(bloom-add "world")
(print (bloom-might-contain-p "hello"))
(print (bloom-might-contain-p "world"))
(print (bloom-might-contain-p "missing"))
