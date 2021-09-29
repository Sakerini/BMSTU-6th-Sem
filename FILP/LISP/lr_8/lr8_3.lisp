(defun dec_all (lst)
	(mapcar #'(lambda (el)
		(cond
			(
				(numberp el)
				(- el 10)
			)
			(
				(atom el)
				el
			)
			(
				(dec_all el)
			)
		)
	   ) lst
	)
)