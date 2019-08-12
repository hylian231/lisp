(defun add-reverse (a b)
  (if (null a)
    b
    (if (member (car a) b :test #'equal) 
      (add-reverse (cdr a) b)
      (add-reverse (cdr a) (cons (car a) b)))))

(defun new-union (a b)
  (let ((new (reverse a)))
    (setf new (add-reverse b new))
    (reverse new)))

(format t "~A~%" (new-union '(1 1 2 3) '(2 3 4 5)))
