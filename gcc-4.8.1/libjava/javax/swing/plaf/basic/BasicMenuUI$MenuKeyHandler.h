
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __javax_swing_plaf_basic_BasicMenuUI$MenuKeyHandler__
#define __javax_swing_plaf_basic_BasicMenuUI$MenuKeyHandler__

#pragma interface

#include <java/lang/Object.h>
extern "Java"
{
  namespace javax
  {
    namespace swing
    {
      namespace event
      {
          class MenuKeyEvent;
      }
      namespace plaf
      {
        namespace basic
        {
            class BasicMenuUI;
            class BasicMenuUI$MenuKeyHandler;
        }
      }
    }
  }
}

class javax::swing::plaf::basic::BasicMenuUI$MenuKeyHandler : public ::java::lang::Object
{

  BasicMenuUI$MenuKeyHandler(::javax::swing::plaf::basic::BasicMenuUI *);
public:
  virtual void menuKeyPressed(::javax::swing::event::MenuKeyEvent *);
  virtual void menuKeyReleased(::javax::swing::event::MenuKeyEvent *);
  virtual void menuKeyTyped(::javax::swing::event::MenuKeyEvent *);
public: // actually package-private
  BasicMenuUI$MenuKeyHandler(::javax::swing::plaf::basic::BasicMenuUI *, ::javax::swing::plaf::basic::BasicMenuUI$MenuKeyHandler *);
  ::javax::swing::plaf::basic::BasicMenuUI * __attribute__((aligned(__alignof__( ::java::lang::Object)))) this$0;
public:
  static ::java::lang::Class class$;
};

#endif // __javax_swing_plaf_basic_BasicMenuUI$MenuKeyHandler__