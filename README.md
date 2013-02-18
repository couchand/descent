descent
=======

Enlightened Apex development.

 * Introduction
 * Warning
 * Getting Started
 * More Information

Introduction
------------

Descent is a transpiler that converts a CoffeeScript-like
syntax into production-quality Apex code.  It is able to
produce classes exhibiting development best practices in
far fewer keystrokes than writing directly in Apex.

For instance, you might code a trigger like this;

	trigger UpdateTotals on opp update
	  updateTotals oldMap, newMap

	OpportunityServices
	  ::updateTotals: (old, new) ->
	    for oldOpp, newOpp in old, new
	      newOpp.Delta = newOpp.Amount - oldOpp.Amount

Which descent would turn into many more lines of Apex code.

Warning
-------

This readme is intended to be proscriptive, not descriptive.
As always, the only true documentation is the code.e

Getting Started
---------------

You should be able to take care of your dependencies by
running an `npm install` after checking out.  It's
probably a good idea to have both CoffeeScript and Jison
installed globally, so in all you need to:

	git clone git://github.com:couchand/descent.git
	npm install -g coffee-script jison
	npm install

Then you can build by running the build script

	./build

Which is a brittle BASH script that really ought to be
converted to a modern build tool.

Once you've built successfully, parse away by running:

	node dst/parser.js INPUT_FILE > OUTPUT_FILE

More Information
----------------

There are more superballs in the world than there are people.
I don't know that, I'm just assuming.  I mean, I have like
twenty myself in the back of a drawer somewhere.
