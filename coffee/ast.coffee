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
  constructor: (variable, def) ->
    @variable = variable
    @default_val = def

class Method
  constructor: (name, parameters) ->
    @name = name
    @parameters = parameters or []
    @body = []

class Variable
  constructor: (@name) ->

class IntLiteral
  constructor: (@value) ->

module.exports = {
  Body: Body
  ApexClass: ApexClass
  Property: Property
  Method: Method
  Variable: Variable
  IntLiteral: IntLiteral
}
