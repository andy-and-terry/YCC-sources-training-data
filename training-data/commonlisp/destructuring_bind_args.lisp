(defun area (spec)
  (destructuring-bind (kind &key (w 1) (h 1) r) spec
    (ecase kind
      (:rect (* w h))
      (:circle (* pi r r)))))

(print (area '(:rect :w 3 :h 4)))
