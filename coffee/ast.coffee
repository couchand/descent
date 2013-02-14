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
  constructor: (name, visibility, body) ->
    @name = name
    @visibility = visibility or PUBLIC
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
    props = indent (property.compile() for property in @properties).join '\n\n'
    meths = indent (method.compile() for method in @methods).join '\n\n'
    """
    #{visibility} class #{@name}
    {
        #{props}

        #{meths}
    }
    """

class Property
  constructor: (variable, visibility, def) ->
    @variable = variable
    @visibility = visibility or PUBLIC
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

    get_viz = @visibility.compile { context: 'get' }
    getter = get_viz + ' ' + getter if get_viz
    set_viz = @visibility.compile { context: 'set' }
    setter = set_viz + ' ' + setter if set_viz

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

LEVEL =
  global: 0
  public: 1
  private: 2

class Visibility
  constructor: (@read, @write) ->
    @total = @read
    @write ?= @read
  compile: (opts) ->
    switch opts?.context
      when 'get'
        if LEVEL[@read] > LEVEL[@total]
          return @read
        return ''
      when 'set'
        if LEVEL[@write] > LEVEL[@total]
          return @write
        return ''
    return @total

GLOBAL = new Visibility 'global'
PUBLIC = new Visibility 'public'
READABLE = new Visibility 'public', 'private'
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
  READABLE: READABLE
  PRIVATE: PRIVATE
}
