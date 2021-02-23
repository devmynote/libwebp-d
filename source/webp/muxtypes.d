module webp.muxtypes;

// Copyright 2012 Google Inc. All Rights Reserved.
//
// Use of this source code is governed by a BSD-style license
// that can be found in the COPYING file in the root of the source
// tree. An additional intellectual property rights grant can be found
// in the file PATENTS. All contributing project authors may
// be found in the AUTHORS file in the root of the source tree.
// -----------------------------------------------------------------------------
//
// Data-types common to the mux and demux libraries.
//
// Author: Urvang (urvang@google.com)

extern (C):

// VP8X Feature Flags.
enum WebPFeatureFlags
{
    ANIMATION_FLAG  = 0x00000002,
    XMP_FLAG        = 0x00000004,
    EXIF_FLAG       = 0x00000008,
    ALPHA_FLAG      = 0x00000010,
    ICCP_FLAG       = 0x00000020,

    ALL_VALID_FLAGS = 0x0000003e
}

// Dispose method (animation only). Indicates how the area used by the current
// frame is to be treated before rendering the next frame on the canvas.
enum WebPMuxAnimDispose
{
    WEBP_MUX_DISPOSE_NONE = 0,  // Do not dispose.
    WEBP_MUX_DISPOSE_BACKGROUND // Dispose to background color.
}

// Blend operation (animation only). Indicates how transparent pixels of the
// current frame are blended with those of the previous canvas.
enum WebPMuxAnimBlend
{
    WEBP_MUX_BLEND = 0, // Blend.
    WEBP_MUX_NO_BLEND   // Do not blend.
}

// Data type used to describe 'raw' data, e.g., chunk data
// (ICC profile, metadata) and WebP compressed image data.
// 'bytes' memory must be allocated using WebPMalloc() and such.
struct WebPData
{
    in ubyte* bytes;
    size_t size;
}

// Initializes the contents of the 'webp_data' object with default values.
void WebPDataInit(WebPData* webp_data);

// Clears the contents of the 'webp_data' object by calling WebPFree().
// Does not deallocate the object itself.
void WebPDataClear(WebPData* webp_data);

// Allocates necessary storage for 'dst' and copies the contents of 'src'.
// Returns true on success.
int WebPDataCopy(in WebPData* src, WebPData* dst);
