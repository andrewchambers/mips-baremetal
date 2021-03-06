
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __java_util_concurrent_atomic_AtomicReferenceFieldUpdater__
#define __java_util_concurrent_atomic_AtomicReferenceFieldUpdater__

#pragma interface

#include <java/lang/Object.h>

class java::util::concurrent::atomic::AtomicReferenceFieldUpdater : public ::java::lang::Object
{

public:
  static ::java::util::concurrent::atomic::AtomicReferenceFieldUpdater * newUpdater(::java::lang::Class *, ::java::lang::Class *, ::java::lang::String *);
public: // actually protected
  AtomicReferenceFieldUpdater();
public:
  virtual jboolean compareAndSet(::java::lang::Object *, ::java::lang::Object *, ::java::lang::Object *) = 0;
  virtual jboolean weakCompareAndSet(::java::lang::Object *, ::java::lang::Object *, ::java::lang::Object *) = 0;
  virtual void set(::java::lang::Object *, ::java::lang::Object *) = 0;
  virtual void lazySet(::java::lang::Object *, ::java::lang::Object *) = 0;
  virtual ::java::lang::Object * get(::java::lang::Object *) = 0;
  virtual ::java::lang::Object * getAndSet(::java::lang::Object *, ::java::lang::Object *);
  static ::java::lang::Class class$;
};

#endif // __java_util_concurrent_atomic_AtomicReferenceFieldUpdater__
