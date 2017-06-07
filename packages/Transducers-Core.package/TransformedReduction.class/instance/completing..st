*Transducers-completing
completing: aCompletingFunction
	
	| completing |
	completing := function completing: aCompletingFunction.
	^TransformedReduction transducer: transducer reduction: completing