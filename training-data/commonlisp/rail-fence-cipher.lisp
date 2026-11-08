(defun rail-index (i rails)
  (let* ((period (* 2 (1- rails))) (m (mod i period)))
    (if (< m rails) m (- period m))))

(defun rail-fence (s rails)
  (let ((rows (make-array rails :initial-element nil)))
    (loop for ch across s for i from 0
          do (push ch (aref rows (rail-index i rails))))
    (coerce (loop for r below rails append (reverse (aref rows r))) 'string)))

(format t "~a~%" (rail-fence "WEAREDISCOVERED" 3))
