*Transducers-Core-transforming
takeWhile
	"Create a transducer that takes the first elements in a row satisfying the receiver from a reducible.
	The receiver's arity is required to be unary or binary."
	
	^TakeWhile predicate: self