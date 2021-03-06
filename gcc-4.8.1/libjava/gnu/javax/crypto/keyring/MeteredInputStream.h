
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __gnu_javax_crypto_keyring_MeteredInputStream__
#define __gnu_javax_crypto_keyring_MeteredInputStream__

#pragma interface

#include <java/io/FilterInputStream.h>
#include <gcj/array.h>

extern "Java"
{
  namespace gnu
  {
    namespace javax
    {
      namespace crypto
      {
        namespace keyring
        {
            class MeteredInputStream;
        }
      }
    }
  }
}

class gnu::javax::crypto::keyring::MeteredInputStream : public ::java::io::FilterInputStream
{

public: // actually package-private
  MeteredInputStream(::java::io::InputStream *, jint);
public:
  jboolean limitReached();
  jint available();
  void close();
  void mark(jint);
  jboolean markSupported();
  jint read();
  jint read(JArray< jbyte > *);
  jint read(JArray< jbyte > *, jint, jint);
  void reset();
  jlong skip(jlong);
private:
  jint __attribute__((aligned(__alignof__( ::java::io::FilterInputStream)))) count;
  jint limit;
public:
  static ::java::lang::Class class$;
};

#endif // __gnu_javax_crypto_keyring_MeteredInputStream__
