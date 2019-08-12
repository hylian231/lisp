(defun our-reverse (lst)
  (let ((acc nil))
    (dolist (elt lst)
      (push elt acc))
    acc))

(format t "~A~%" (our-reverse '(1 2 nil 4 5)))
