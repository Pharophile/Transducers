An eduction forms a reducible by applying a transducer to the items of another reducible, e.g., a collection or a stream.
The applications will be performed every time #reduce:init: / #transduce:reduce:init: is called. Thus, an eduction can be seen as virtual collection.

Overview
An eduction performs a reduction #reduce:init: by calling #transduce:reduce:init: with the bound transducer on the wrapped reducible.
Similarily, it performs #transduce:reduceinit: by applying the bound transducer to the function and then calling #transduces:function:init: with the transformed function on the wrapped reducible.
Hence, if eductions are nested, the computation is performed by the innermost reducible and no intermediate data representation is generated.
Since the appliation is lazy, no processing happens until #reduce:init: or #transduce:reduce:init: is invoked.

Usage
For example, creating a virtual collection of the squares of odd numbers.

	| source eduction sum squares n |
	"simple source collection"
	source := 1 to: 1000.
	eduction := #squared map <~ #odd filter <~ source.
	sum := eduction reduce: #+ init: 0.			"processing happens here"
	squares := OrderedCollection <~ eduction.		"processing happens here"

	"infinite source"
	n := 0.
	source := [n := n + 1].
	eduction := #squared map <~ #odd filter <~ source.
	squares := OrderedCollection <~ 500 take <~ eduction.

Instance Variables
	reducible	<Reducible>	a reducible that will be asked to do the reduction
	transducer	<Transducer>	a transducer that transforms the reducing function

