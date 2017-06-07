*Transducers-instance creation
apply: aTransducer to: aReducible
	
	^(self new)
		reducible: aReducible transducer: aTransducer;
		"beImmutable;"
		yourself