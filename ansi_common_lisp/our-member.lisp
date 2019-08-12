(defun our-member (s lst)
  (if (atom lst)
    nil
    (if (eql s (car lst))
      lst
      (our-member s (cdr lst)))))

(format t "~A~%" (our-member 5 '(1 3 5 7 9)))
