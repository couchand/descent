# Abstract syntax tree nodes for descent

class Body
  constructor: ->
    @classes = []

class ApexClass
  constructor: (name, body) ->
    @name = name
    @properties = []
    @methods = []
    @inners = []
    @sortMembers body

  sortMembers: (members) ->
    for member in members
      @properties.push member if member instanceof Property
      @methods.push member if member instanceof Method

  compile: ->
    members = (property.compile() for property in @properties).join ';\n    '
    members += ';\n\n    ' if members isnt ''
    for method in @methods
      members += method.compile().replace /\n/g, "\n    "
    "public class #{@name}\n{\n    #{members}\n}\n"

class Property
  constructor: (variable, def) ->
    @variable = variable
    @default_val = def
  compile: ->
    s = "public Object #{@variable.compile()}"
    s += " = #{@default_val.compile()}" if @default_val?
    s

class Method
  constructor: (identifier, parameters, body) ->
    @identifier = identifier
    @parameters = parameters or []
    @body = body or []
  compile: ->
    name = @identifier.name
    params = (param.compile() for param in @parameters).join ', '
    params = ' ' + params + ' ' if params isnt ''
    bod = (line.compile() for line in @body).join ';\n    '
    "public void #{name}(#{params})\n{\n    #{bod}\n}"

class Variable
  constructor: (@name) ->
  compile: -> @name

class IntLiteral
  constructor: (@value) ->
  compile: -> @value

module.exports = {
  Body: Body
  ApexClass: ApexClass
  Property: Property
  Method: Method
  Variable: Variable
  IntLiteral: IntLiteral
}
