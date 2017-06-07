*Transducers-Core-reducing
reduce: aReducingFunction init: value pass: pass
	"Generic reduce implementation for all collections, see Reducible>>reduce:init:.
	The reducing function may be binary or ternary, e.g., #+ or [:result :key :val | ... ].
	Fails for ternary reducing functions if the receiver does not understand #keysAndValuesDo:.

	Pass ReducedNotification iff pass is true."
	
	| result |
	result := [aReducingFunction arity = 3
		ifTrue: [self reduceKeysAndValues: aReducingFunction init: value]
		ifFalse: [self reduceValues: aReducingFunction init: value]]
		on: Reduced
		do:
			[:reduced | 
			pass ifTrue: [reduced pass].	"reduction finished, get result"
			reduced parameter].
	^aReducingFunction complete: result