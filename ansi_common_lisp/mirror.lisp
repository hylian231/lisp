(defun mirror (x)
  (if (consp x)
    (equal x (reverse x))
    t))

(format t "~A~%" (mirror '(a b c b a)))
