(defun swap-first-last(lst)
	(cond 
		(
			(null (cdr lst))
			lst
		)
		(
			(nconc 
				(
					mapcon #'(lambda (el) 
					(cond
						(
							(null (cdr el))
							el
						)
					)
				   ) lst
				)
				(
					mapcon #'(lambda (el) 
					(cond
						(
							(cdr el)
							(cons (car el) nil) 
						)
					)
				   ) (cdr lst)
				)
				(cons (car lst) nil)
			)
		)
	)
)