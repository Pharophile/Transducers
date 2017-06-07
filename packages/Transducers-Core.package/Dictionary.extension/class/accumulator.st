*Transducers-Core-data flow
accumulator
	
	^[:col :key :val | 
	col
		at: key put: val;
		yourself]