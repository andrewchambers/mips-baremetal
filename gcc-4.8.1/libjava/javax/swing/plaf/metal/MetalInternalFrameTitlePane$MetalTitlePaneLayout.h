
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __javax_swing_plaf_metal_MetalInternalFrameTitlePane$MetalTitlePaneLayout__
#define __javax_swing_plaf_metal_MetalInternalFrameTitlePane$MetalTitlePaneLayout__

#pragma interface

#include <java/lang/Object.h>
extern "Java"
{
  namespace java
  {
    namespace awt
    {
        class Component;
        class Container;
        class Dimension;
    }
  }
  namespace javax
  {
    namespace swing
    {
      namespace plaf
      {
        namespace metal
        {
            class MetalInternalFrameTitlePane;
            class MetalInternalFrameTitlePane$MetalTitlePaneLayout;
        }
      }
    }
  }
}

class javax::swing::plaf::metal::MetalInternalFrameTitlePane$MetalTitlePaneLayout : public ::java::lang::Object
{

public:
  MetalInternalFrameTitlePane$MetalTitlePaneLayout(::javax::swing::plaf::metal::MetalInternalFrameTitlePane *);
  virtual void addLayoutComponent(::java::lang::String *, ::java::awt::Component *);
  virtual void layoutContainer(::java::awt::Container *);
  virtual ::java::awt::Dimension * minimumLayoutSize(::java::awt::Container *);
  virtual ::java::awt::Dimension * preferredLayoutSize(::java::awt::Container *);
  virtual void removeLayoutComponent(::java::awt::Component *);
public: // actually package-private
  ::javax::swing::plaf::metal::MetalInternalFrameTitlePane * __attribute__((aligned(__alignof__( ::java::lang::Object)))) this$0;
public:
  static ::java::lang::Class class$;
};

#endif // __javax_swing_plaf_metal_MetalInternalFrameTitlePane$MetalTitlePaneLayout__
