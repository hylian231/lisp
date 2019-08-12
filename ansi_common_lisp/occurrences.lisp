(defun occurrences (lst)
  (check lst nil))

(defun check (lst records)
  (if (not (consp lst))
    (sort-decending records)
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

(defun exchange(lst)
 (if (< (second (car lst))
	(second (second lst)))
   (let ((upper (pop lst))
	 (lower (pop lst)))
     (push upper lst)
     (push lower lst)
     lst)
   lst))

(defun send-lower (lst)
  (if (null (cdr lst))
    lst
    (progn
      (setf lst (exchange lst))
      (setf lst (cons (car lst) (send-lower (cdr lst))))
      lst)))

(defun sort-decending (lst)
  (if (null (cdr lst))
    lst
    (let ((len (length lst)))
      (setf lst (send-lower lst))
      (setf lst (append (sort-decending (subseq lst 0 (- len 1)))
			(list (nth (- len 1) lst))))
      lst)))

(format t "~A~%" (occurrences '(a a b b a b c c d d e e e))) 
;(format t "~A~%" (rotate '((a 1) (b 2) (c 3) (d 4)))) 
;(format t "~A~%" (counts 'b '((a 1) (b 2) (c 3) (d 4)))) 
;(format t "~A~%" (exchange '((a 1) (b 2) (c 3) (d 4)))) 
;(format t "~A~%" (send-lower '((a 1) (b 2) (c 3) (d 4)))) 
;(format t "~A~%" (sort-decending '((a 3) (b 2) (c 3) (d 4)))) 
