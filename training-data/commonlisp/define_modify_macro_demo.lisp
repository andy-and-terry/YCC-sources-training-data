;; define-modify-macro builds setf-style update operators such as incf.
(define-modify-macro multf (factor) *
  "Multiply the place by FACTOR.")

(define-modify-macro appendf (&rest lists) append
  "Append LISTS onto the place.")

(define-modify-macro toggle-flag () not)

(let ((n 5))
  (multf n 4)
  (format t "n = ~a~%" n))

(let ((items (list 1 2)))
  (appendf items '(3 4) '(5))
  (format t "items = ~a~%" items))

(let ((flag nil))
  (toggle-flag flag)
  (format t "flag = ~a~%" flag)
  (toggle-flag flag)
  (format t "flag = ~a~%" flag))

;; Works on any setf place, such as array elements and hash table values.
(let ((vec (vector 1 2 3))
      (table (make-hash-table)))
  (multf (aref vec 1) 10)
  (setf (gethash :score table) 7)
  (multf (gethash :score table) 3)
  (format t "vec = ~a, score = ~a~%" vec (gethash :score table)))
