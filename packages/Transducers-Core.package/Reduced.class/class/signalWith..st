*Transducers-signalling
signalWith: aParameter
	"Raise an Reduced exception with parameter set to aParameter."

	^(self new)
		parameter: aParameter;
		signal