*Transducers-Core-transforming
mapcat
	"Create a transducer that
	a) maps a reducible's elements using the receiver and
	b) concatenates the results.
	The receiver is required to yield reducibles and its arity is required to be unary or binary."
	
	^Cat <~ self map