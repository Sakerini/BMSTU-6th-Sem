(defun get_first_list (lst)
	(cond	
		(
			(and	
				(listp (car lst))
				(not (null (car lst)))
			)
			(car lst)
		)
		(
			(get_first_list (cdr lst))
		)
	)
)