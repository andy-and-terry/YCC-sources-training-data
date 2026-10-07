(defstruct circular-buffer
  (data (make-array 5))
  (capacity 5)
  (head 0)
  (count 0))

(defun cb-push (cb value)
  (let ((tail (mod (+ (circular-buffer-head cb) (circular-buffer-count cb))
                    (circular-buffer-capacity cb))))
    (setf (aref (circular-buffer-data cb) tail) value)
    (if (= (circular-buffer-count cb) (circular-buffer-capacity cb))
        (setf (circular-buffer-head cb)
              (mod (1+ (circular-buffer-head cb)) (circular-buffer-capacity cb)))
        (incf (circular-buffer-count cb)))))

(defun cb-to-list (cb)
  (loop for i from 0 below (circular-buffer-count cb)
        collect (aref (circular-buffer-data cb)
                       (mod (+ (circular-buffer-head cb) i) (circular-buffer-capacity cb)))))

(let ((cb (make-circular-buffer)))
  (dolist (v '(1 2 3 4 5 6 7))
    (cb-push cb v))
  (format t "~a~%" (cb-to-list cb)))
