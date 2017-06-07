*Transducers-printing
printOn: aStream
	
	aStream nextPut: $(.
	function printOn: aStream.
	aStream
		space;
		nextPutAll: #init:;
		space.
	self value printOn: aStream.
	aStream nextPut: $)