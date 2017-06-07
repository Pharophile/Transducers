*Transducers-accessing
at: index ifAbsent: aBlock
	"Answer the value at index.  If index is not found, answer the result of evaluating aBlock."
	
	^[collection at: index] on: IndexNotFoundError do: aBlock