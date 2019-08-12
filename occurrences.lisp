(defun occurrences (lst)
  (check lst nil))

(defun check (lst records)
  (if (not (consp lst))
    records
    (let ((s (pop lst)))
      (if (null(assoc s records))
	(setf records (cons (list s 1) records))
	(setf records (counts s records)))
      (check lst records))))

(defun counts (s lst)
  (if (equal s (car (car lst)))
    (let ((x (pop lst)))
      (setf x (list s (+ (car (cdr x)) 1)))
      (push x lst))
    (progn
      (setf lst (rotate lst))
      (counts s lst))))

(defun rotate (lst)
  (let ((x (pop lst)))
    (setf lst (append lst (list x)))
    lst))

;(format t "~A~%" (rotate '((a 1) (b 2) (c 3) (d 4)))) 
;(format t "~A~%" (counts 'b '((a 1) (b 2) (c 3) (d 4)))) 
(format t "~A~%" (occurrences '(a a b b a b c c d d e e e))) 
