(setf arr (make-array '(2 3) :initial-element nil))

(setf (aref arr 0 0) 'a)

(setf vec (make-array 5 :initial-element nil))

(setf *print-array* t)

(setf vector1 (vector "a" 'b 3))

;error: length can be applied to single vector only
;(setf len (length arr))
(setf len2 (length vec))

(format t "~A~%" arr)
(format t "~A~%" #2a((b nil nil) (nil nil nil)))
(format t "~A~%" vec)
(format t "~A~%" #(1 2 3 4 5))
(format t "~A~%" vector1)
(format t "~A~%" (svref vector1 2))
;(format t "~A~%" len)
(format t "~A~%" len2)

