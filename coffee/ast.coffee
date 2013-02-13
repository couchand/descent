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
    members = ''
    for property in @properties
      members += property.compile().replace /\n/g, "\n    "
      members += '\n\n    '
    for method in @methods
      members += method.compile().replace /\n/g, "\n    "
    "public class #{@name}\n{\n    #{members}\n}\n"

class Property
  constructor: (variable, def) ->
    @variable = variable
    @default_val = def
  compile: ->
    v = @variable.compile()
    getter = if !@default_val? then 'get;' else "get\n{\n    if ( #{v} == null )\n    {\n        #{v} = #{@default_val.compile()};\n    }\n    return #{v};\n}"
    getter = getter.replace /\n/g, '\n    '
    setter = "set;"
    "public Object #{v}" + "\n{\n    #{getter}\n    #{setter}\n}"

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
