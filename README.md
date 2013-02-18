descent
=======

Enlightened Apex development.

 * Introduction
 * Warning
 * Getting Started
 * Philosopy
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

Philosophy
----------

The goal of descent is to be as terse as possible while
also being obvious.  The syntax is largely taken from
CoffeeScript, as was much of the inspiration.  Since both
engines aim to transpile code, and the structure of
JavaScript is largely similar to that of Apex, this seems
reasonable.

It must be possible to express every important concept from
Apex in this language.  Many things that must be made
explicit in Apex can be left implicit in descent.  This
makes it easy both to make a mistake and to find a mistake.

Apex requires each class, interface and trigger to be written
in its own file.  Descent dispenses with that idea, freeing
you to keep whatever file structure is appropriate for the
project.  What this means is that:

 * A file can contain multiple classes.
   This is to keep related functionality together:  keep a
   class and its test in one file, or a trigger and the
   associated service class.
 * A class can span multiple files.
   This is useful for mixin behavior:  have a standard set
   of classes that are mixed in with custom behavior for
   a given client.

The header of a class is the next place for optimization:
Apex requires that you specify the visibility of a class,
but descent uses the principle of convention over
configuration.  Thus, if not specified, top level classes
take the reasonable default of `public`.

To mark a class as a test in Apex, you must use the keyword-
annotation combo `@isTest private`.  In descent, you simply
say `test`.

To extend a class in Apex requires the keyword `extend`,
but in descent you simply use the character `&lt;`.  In Apex
you must explicitly list any interfaces implemented by a
class.  Descent works differently, using the principle of
duck-typing: _if it looks like a duck, and quacks like a
duck, it's probably a duck_.  If a class implements each
of the methods specified in an interface, descent will
automatically mark it as inheriting that interface.  This
has profound implications on the type inference system,
described later.

Apex classes have four different types of members: methods,
variables, properties, and inner classes.  Descent has only
three, by abstracting the distinction between variables and
properties.  Specifically, descent makes some assumptions
about which you would like to use.

 * If a variable is written in ALL_CAPS, the resulting class
   member will default to `public static final`.
 * If a variable is `private`, the class member will be a
   regular Apex variable.
 * Otherwise, the class member will be a property.

This assumption that all class variables are properties is
just one of the many ways that descent helps make writing
code much faster -- the only reason not to make a class
variable a property in Apex is the additional keystrokes
required.

More Information
----------------

There are more superballs in the world than there are people.
I don't know that, I'm just assuming.  I mean, I have like
twenty myself in the back of a drawer somewhere.
