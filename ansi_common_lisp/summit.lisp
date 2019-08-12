(defun summit (lst)
  (setf lst (remove nil lst))
  (apply #'+ lst))

(format t "~A~%" (summit '(nil 1 nil 2 nil 3 nil 4 nil 5 nil)))
