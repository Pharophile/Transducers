*Transducers-Core-data flow
<~ anObject
	"Compose the receiver and an object."
	
	| accumulator |
	accumulator := [:stream :each | 
	stream
		nextPut: each;
		yourself].
	^(accumulator init: self) <~ anObject