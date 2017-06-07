*Transducers-Core-transforming
dropWhile
	"Create a transducer that drops the first elements in a row satisfying the receiver from a reducible.
	The receiver's arity is required to be unary or binary."
	
	^DropWhile predicate: self