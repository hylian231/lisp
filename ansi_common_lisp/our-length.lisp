(defun our-length (lst)
  (if (atom lst)
    nil
    (if (null (cdr lst))
      1
      (+ 1 (our-length (cdr lst))))))

(format t "~A~%" (our-length '(1 2 3 4 5)))
