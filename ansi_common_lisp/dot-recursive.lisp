(defun dot (x)
  (if (eql 0 x)
    t
    (progn
      (format t ".")
      (dot (- x 1)))))

(dot 5)
