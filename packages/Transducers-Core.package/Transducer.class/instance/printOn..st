*Transducers-printing
printOn: aStream
	
	aStream
		nextPutAll: self class name;
		space;
		nextPutAll: #new