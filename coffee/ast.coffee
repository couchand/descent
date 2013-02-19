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
    @inner_classes = []
    @sortMembers body

  sortMembers: (members) ->
    for member in members
      @properties.push member if member instanceof Property
      @methods.push member if member instanceof Method
      @inner_classes.push member if member instanceof InnerClass

  compile: ->
    visibility = @visibility.compile()
    props = indent (property.compile() for property in @properties).join '\n\n'
    meths = indent (method.compile() for method in @methods).join '\n\n'
    inners = indent (inner.compile() for inner in @inner_classes).join '\n\n'
    all = []
    all.push props if props isnt ''
    all.push meths if meths isnt ''
    all.push inners if inners isnt ''
    members = all.join '\n\n'
    header = "#{visibility} class #{@name}"
    return "#{header} {}" if members is ''
    """
    #{header}
    {
        #{members}
    }
    """

class InnerClass extends ApexClass
  constructor: (name, visibility, body) ->
    super name, visibility, body

class Property
  constructor: (variable, visibility, def) ->
    @variable = variable
    @visibility = visibility or PUBLIC
    @default_val = def
  compile: ->
    visibility = @visibility.compile()
    type = 'Object'
    v = @variable.compile()
    if @visibility.hasFinal and @visibility.hasFinal()
      return """
             #{visibility} #{type} #{v} = #{@default_val.compile()};
             """

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
  constructor: (name, visibility, parameters, body) ->
    @name = name
    @visibility = visibility or PUBLIC
    @parameters = parameters or []
    @body = body or []
  compile: ->
    visibility = @visibility.compile()
    return_type = 'void'
    params = (param.compile() for param in @parameters).join ', '
    params = ' ' + params + ' ' if params isnt ''
    bod = (line.compile() for line in @body).join ';\n    '
    """
    #{visibility} #{return_type} #{@name}(#{params})
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

class StrLiteral
  constructor: (@value) ->
  compile: -> @value

class EmbeddedApex
  constructor: (text) ->
    @value = text.slice 1, text.length-1
  compile: -> @value

LEVEL =
  global: 0
  public: 1
  private: 2

class VisibilityType
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

class Visibility
  constructor: (type) ->
    @types = [type]
  add: (type) ->
    @types.push type unless @types.indexOf type
  hasFinal: ->
    for type in @types
      return true if type is FINAL
    return false
  compile: (opts) ->
    (type.compile opts for type in @types).join ' '

GLOBAL = new VisibilityType 'global'
PUBLIC = new VisibilityType 'public'
READABLE = new VisibilityType 'public', 'private'
PRIVATE = new VisibilityType 'private'
STATIC = new VisibilityType 'static'
FINAL = new VisibilityType 'final'

module.exports = {
  Body: Body
  ApexClass: ApexClass
  InnerClass: InnerClass
  Property: Property
  Method: Method
  Variable: Variable
  IntLiteral: IntLiteral
  StrLiteral: StrLiteral
  Visibility: Visibility
  EmbeddedApex: EmbeddedApex
  GLOBAL: GLOBAL
  PUBLIC: PUBLIC
  READABLE: READABLE
  PRIVATE: PRIVATE
  STATIC: STATIC
  FINAL: FINAL
}
