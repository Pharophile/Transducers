*Transducers-completing
complete: value
	"Perform the attached completing action after the functions own completing action"
	
	^completing value: (function complete: value)