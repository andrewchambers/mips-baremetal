
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __java_awt_Container$GfxVisitor__
#define __java_awt_Container$GfxVisitor__

#pragma interface

#include <java/lang/Object.h>
extern "Java"
{
  namespace java
  {
    namespace awt
    {
        class Component;
        class Container$GfxVisitor;
        class Graphics;
    }
  }
}

class java::awt::Container$GfxVisitor : public ::java::lang::Object
{

public: // actually package-private
  Container$GfxVisitor();
public:
  virtual void visit(::java::awt::Component *, ::java::awt::Graphics *) = 0;
  static ::java::lang::Class class$;
};

#endif // __java_awt_Container$GfxVisitor__
