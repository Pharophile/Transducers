*Transducers-instance creation
first: aTransducer1 second: aTransducer2
	"Create a new composed transducer unless an argument is an Identity transducer.
	Since the latter does no transformation, return the other transducer."
	
	aTransducer1 == Identity transducer ifTrue: [^aTransducer2].
	aTransducer2 == Identity transducer ifTrue: [^aTransducer1].
	^(self new)
		first: aTransducer1 second: aTransducer2;
		yourself