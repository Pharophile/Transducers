*Transducers-Core-reducing
reduceKeysAndValues: aReducingFunction init: value

	| function key result |
	function := aReducingFunction nonCompleting.
	key := 0.
	result := value.
	[key := key + 1.
	result := function
		value: result
		value: key
		value: self next] repeat.
	self error: 'This code should be unreachable.'