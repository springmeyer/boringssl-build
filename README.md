# boringssl-build

Build boringssl, which is an openssl alternative from google: https://www.imperialviolet.org/2014/06/20/boringssl.html

I've not found formal instructions on using boringssl outside of chromium, but here's what I've learned through a few minutes of experimentation:

 - Boringssl source code appears to live at <https://boringssl.googlesource.com/boringssl>
 - The gyp build scripts live within chromium at <https://chromium.googlesource.com/experimental/chromium/src/+/master/third_party/boringssl/>
 - The gyp build scripts appear to be out of sync with the files available upstream, but you can get them back in sync by running `python update_gypi_and_asm.py` which lives inside chromium
 - Then you just need to set a few options like library type (static vs shared) and architecture (e.g. x64 of x86)
 - Then building works perfectly on both os x and linux x64 (all I've tested so far)

See the `./build.sh` for details.
