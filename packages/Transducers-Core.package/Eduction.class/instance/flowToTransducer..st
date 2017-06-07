*Transducers-data flow
flowToTransducer: aTransducer
	
	^Eduction
		apply: transducer * aTransducer
		to: reducible