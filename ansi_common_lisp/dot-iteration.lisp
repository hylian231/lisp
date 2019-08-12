(defun dot (x)
  (do ((i 0 (+ i 1)))
      ((eql i x) t)
      (format t ".")))

(dot 5)
