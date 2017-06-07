*Transducers-Core-printing
printAsFunctionOn: aStream
	
	self printOn: aStream
	"Disable printing decompiled code"
	"| meth cls code src wsSeen convertSeparators reduceSpaces |
	meth := self method.
	cls := meth homeMethod mclass.
	code := cls decompilerClass new decompileBlock: meth in: cls.
	src := code formattedCode asString.
	convertSeparators := [:c | 
	c isSeparator
		ifTrue: [Character space]
		ifFalse: [c]] map.
	wsSeen := false.
	reduceSpaces := [:c | wsSeen & (wsSeen := c isSeparator)] remove.
	reduceSpaces <~ convertSeparators <~ src
		reduce:
			[:stream :c | 
			stream
				nextPut: c;
				yourself]
		init: aStream"