(defvar *parent* (make-array 6))

(defun uf-init (n)
  (setf *parent* (make-array n))
  (dotimes (i n) (setf (aref *parent* i) i)))

(defun uf-find (x)
  (if (= (aref *parent* x) x)
      x
      (setf (aref *parent* x) (uf-find (aref *parent* x)))))

(defun uf-union (a b)
  (let ((ra (uf-find a)) (rb (uf-find b)))
    (unless (= ra rb) (setf (aref *parent* rb) ra))))

(uf-init 6)
(uf-union 0 1)
(uf-union 1 2)
(print (= (uf-find 0) (uf-find 2)))
(print (= (uf-find 0) (uf-find 5)))
