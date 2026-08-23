(defgeneric area (shape))

(defstruct circle radius)
(defstruct rectangle width height)

(defmethod area ((s circle))
  (* pi (circle-radius s) (circle-radius s)))

(defmethod area ((s rectangle))
  (* (rectangle-width s) (rectangle-height s)))

(print (area (make-circle :radius 2)))
(print (area (make-rectangle :width 3 :height 4)))
