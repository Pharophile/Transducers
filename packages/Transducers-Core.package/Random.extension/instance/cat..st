*Transducers-Core-concatenating
cat: aReducible
	"Concatenate the receiver and the reducible argument."

	^Cat <~ (Array with: self with: aReducible)