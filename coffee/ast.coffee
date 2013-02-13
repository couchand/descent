# Abstract syntax tree nodes for descent

tabchar = '    '

indent = (txt, num=1) ->
  tabs = '\n'
  for i in [0...num]
    tabs += tabchar
  txt.replace /\n/g, tabs

class Body
  constructor: ->
    @classes = []

class ApexClass
  constructor: (name, body) ->
    @name = name
    @visibility = PUBLIC
    @properties = []
    @methods = []
    @inners = []
    @sortMembers body

  sortMembers: (members) ->
    for member in members
      @properties.push member if member instanceof Property
      @methods.push member if member instanceof Method

  compile: ->
    visibility = @visibility.compile()
    members = ''
    for property in @properties
      members += property.compile()
      members += '\n\n'
    for method in @methods
      members += method.compile()
    members = indent members
    """
    #{visibility} class #{@name}
    {
        #{members}
    }
    """

class Property
  constructor: (variable, def) ->
    @variable = variable
    @visibility = PUBLIC
    @default_val = def
  compile: ->
    visibility = @visibility.compile()
    type = 'Object'
    v = @variable.compile()
    getter
    if !@default_val?
       getter = 'get;'
    else
      getter = """
               get
               {
                   if ( #{v} == null )
                   {
                       #{v} = #{@default_val.compile()};
                   }
                   return #{v};
               }
               """
    setter = "set;"
    getter = indent getter
    setter = indent setter
    """
    #{visibility} #{type} #{v}
    {
        #{getter}
        #{setter}
    }
    """

class Method
  constructor: (identifier, parameters, body) ->
    @identifier = identifier
    @visibility = PUBLIC
    @parameters = parameters or []
    @body = body or []
  compile: ->
    visibility = @visibility.compile()
    return_type = 'void'
    name = @identifier.name
    params = (param.compile() for param in @parameters).join ', '
    params = ' ' + params + ' ' if params isnt ''
    bod = (line.compile() for line in @body).join ';\n    '
    """
    #{visibility} #{return_type} #{name}(#{params})
    {
        #{bod}
    }
    """

class Variable
  constructor: (@name) ->
  compile: -> @name

class IntLiteral
  constructor: (@value) ->
  compile: -> @value

class Visibility
  constructor: (@value) ->
  compile: -> @value

GLOBAL = new Visibility 'global'
PUBLIC = new Visibility 'public'
PRIVATE = new Visibility 'private'

module.exports = {
  Body: Body
  ApexClass: ApexClass
  Property: Property
  Method: Method
  Variable: Variable
  IntLiteral: IntLiteral
  GLOBAL: GLOBAL
  PUBLIC: PUBLIC
  PRIVATE: PRIVATE
}
