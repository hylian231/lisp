(defun add-reverse (a b)
  (if (null a)
    b
    (add-reverse (cdr a) (cons (car a) b))))

(defun our-reverse (lst)
  (if (atom lst)
    lst
    (add-reverse lst nil)))

(format t "~A~%" (our-reverse '(1 1 2 3 2 3 4 5)))
