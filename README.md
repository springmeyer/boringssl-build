# boringssl-build

Build boringssl, an openssl alternative from google: https://www.imperialviolet.org/2014/06/20/boringssl.html

[![Build Status](https://travis-ci.org/springmeyer/boringssl-build.svg?branch=master)](https://travis-ci.org/springmeyer/boringssl-build)

Boringssl source code lives at <https://boringssl.googlesource.com/boringssl>

To build boringssl standalone and outside of chromium with cmake follow [these instructions](https://boringssl.googlesource.com/boringssl/+/3ce3c369cb05b4ba9dcaad79b552713e7fa3581f/BUILDING).

You can also build with gyp:

 - The gyp build scripts live within chromium at <https://chromium.googlesource.com/experimental/chromium/src/+/master/third_party/boringssl/>
 - The gyp build scripts appear to be out of sync with the files available upstream, but you can get them back in sync by running `python update_gypi_and_asm.py` which lives inside chromium
 - Then you just need to set a few options like library type (static vs shared) and architecture (e.g. x64 of x86)
 - Then building works perfectly on both os x and linux x64 (all I've tested so far)

See the `./build.sh` for details.
