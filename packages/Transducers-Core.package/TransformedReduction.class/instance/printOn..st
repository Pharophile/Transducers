*Transducers-printing
printOn: aStream
	
	function printOn: aStream.
	aStream
		space;
		nextPutAll: #<~;
		space.
	transducer printOn: aStream