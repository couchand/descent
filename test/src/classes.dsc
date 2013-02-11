public Foobar
  public InnerPublic
  private InnerPrivate

global Baz
  global InnerGlobal
  private InnerPrivate

@isTest private FoobarTest
  FoobarMock extends Foobar
  InnerPublicMock extends Foobar.InnerPublic
