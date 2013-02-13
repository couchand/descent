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
    @properties = []
    @methods = []
    @inners = []
    @sortMembers body

  sortMembers: (members) ->
    for member in members
      @properties.push member if member instanceof Property
      @methods.push member if member instanceof Method

  compile: ->
    visibility = 'public'
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
    @default_val = def
  compile: ->
    visibility = 'public'
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
    @parameters = parameters or []
    @body = body or []
  compile: ->
    visibility = 'public'
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

module.exports = {
  Body: Body
  ApexClass: ApexClass
  Property: Property
  Method: Method
  Variable: Variable
  IntLiteral: IntLiteral
}
