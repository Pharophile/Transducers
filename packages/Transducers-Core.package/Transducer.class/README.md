A transducer (xf or xform) is a transformation from one reducing function to another:

	xf : (A x I -> A) -> (A x I -> A)

Subclasses must implement the following messages:
	transforming
		transform:
			Transform a reducing function into another reducing function.
