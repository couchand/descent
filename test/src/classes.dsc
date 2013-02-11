public Foobar
  public InnerPublic
  private InnerPrivate

global Baz
  global InnerGlobal
  private InnerPrivate

@isTest private FoobarTest
  FoobarMock extends Foobar
  InnerPublicMock extends Foobar.InnerPublic

MyClass
  instanceProperty = 'foo'
  ::classProperty = 'bar'
  ::CLASS_CONSTANT = 3.141592653

  instanceMethod ->
    classMethod instanceProperty
  ::classMethod (str) ->
    str + classProperty
