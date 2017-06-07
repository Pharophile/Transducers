A Reducible is an object that responds to #reduce:, #reduce:init: and #reduce:init:pass:. Typical instances are collections and streams. This class serves primarily as an interface definition.

Subclasses must implement the following messages:
	reducing
		reduce:init:pass:
