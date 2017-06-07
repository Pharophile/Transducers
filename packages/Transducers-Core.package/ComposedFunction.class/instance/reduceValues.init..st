*Transducers-reducing
reduceValues: aReducingFunction init: value
	
	| function result |
	function := aReducingFunction nonCompleting.
	result := value.
	[result := function
		value: result
		value: self value] repeat.
	self error: 'This code should be unreachable.'