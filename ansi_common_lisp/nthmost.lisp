(defun nthmost (n lst)
  (nth (- n 1)
       (sort (copy-list lst) #'>)))

(format t "~A~%" (nthmost 3 '(3 9 1 7 5)))
