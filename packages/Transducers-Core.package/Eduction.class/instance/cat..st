*Transducers-concatenating
cat: aReducible
	"Concatenate the receiver and the reducible argument."
	
	| selfOrReducible |
	selfOrReducible := transducer = Identity transducer
		ifTrue: [reducible]
		ifFalse: [self].
	^Cat <~ (Array with: selfOrReducible with: aReducible)