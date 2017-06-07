*Transducers-Core-reducing
reduceKeysAndValues: aReducingFunction init: value
	
	| function key result each |
	function := aReducingFunction nonCompleting.
	key := 0.
	result := value.
	[each := [self value]
		on: Reduced
		do: [^result].
	key := key + 1.
	result := function value: result value: key value: each] repeat.
	self error: 'This code should be unreachable.'