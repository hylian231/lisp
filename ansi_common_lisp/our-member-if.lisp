(defun our-member-if (func lst)
  (and (consp lst)
       (if (funcall func (car lst))
           lst
           (our-member-if func (cdr lst)))))

(defconstant *a* (our-member-if #'oddp '(2 3 4)))
(format t "~A~%" *a*)
