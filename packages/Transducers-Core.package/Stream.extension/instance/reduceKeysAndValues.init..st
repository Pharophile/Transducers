*Transducers-Core-reducing
reduceKeysAndValues: aReducingFunction init: value
	
	| function key result |
	function := aReducingFunction nonCompleting.
	key := 0.
	result := value.
	self
		do:
			[:each | 
			key := key + 1.
			result := function value: result value: key value: each].
	^result