*Transducers-Core-data flow
<~ anObject
	"Compose the receiver and an object."
	
	^(self accumulator initializer: [self new]) <~ anObject