(defun our-reverse (lst)
  (if (atom lst)
    lst
    (let ((rev nil))
      (mapcar #'(lambda (x) (push x rev)) lst)
      rev)))

(format t "~A~%" (our-reverse '(1 2 3 4 5)))
