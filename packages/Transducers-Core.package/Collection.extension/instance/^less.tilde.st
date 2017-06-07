*Transducers-Core-data flow
<~ anObject
	"Compose the receiver and an object."
	
	^(self class accumulator init: self) <~ anObject