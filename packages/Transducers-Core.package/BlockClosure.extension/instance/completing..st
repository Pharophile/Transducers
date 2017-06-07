*Transducers-Core-completing
completing: aCompletingFunction
	"Attach an additional completing action."
	
	^CompletingReducingFunction function: self completing: aCompletingFunction