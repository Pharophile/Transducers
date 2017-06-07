*Transducers-instance creation
to: aReducible
	
	^self
		apply: Identity transducer
		to: aReducible