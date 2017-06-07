*Transducers-data flow
flowFromTransducer: aTransducer
	
	^TransformedReduction
		transducer: transducer <~ aTransducer
		reduction: function