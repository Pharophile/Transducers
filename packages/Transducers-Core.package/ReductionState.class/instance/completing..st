*Transducers-completing
completing: aCompletingFunction
	
	| completing |
	completing := function completing: aCompletingFunction.
	^ReductionState function: completing init: value