# Abstract syntax tree nodes for descent

class Body
  constructor: ->
    @classes = []

class ApexClass
  constructor: (name) ->
    @name = name
    @properties = []
    @methods = []
    @inners = []

class Property
  constructor: (name, def) ->
    @name = name
    @default_val = def

class Method
  constructor: (name, parameters) ->
    @name = name
    @parameters = parameters or []
    @body = []

class Variable
  constructor: (name) ->
    @name = name

module.exports = {
  Body: Body
  ApexClass: ApexClass
  Property: Property
  Method: Method
  Variable: Variable
}
