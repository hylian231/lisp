(defun get-second-word (str)
  (let ((pos (+ 1 (position #\  str))))
    (subseq str pos (position #\  str :start pos))))

(format t "~A~%" (get-second-word "I am the law."))
