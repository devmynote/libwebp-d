module webp.types;

// Copyright 2010 Google Inc. All Rights Reserved.
//
// Use of this source code is governed by a BSD-style license
// that can be found in the COPYING file in the root of the source
// tree. An additional intellectual property rights grant can be found
// in the file PATENTS. All contributing project authors may
// be found in the AUTHORS file in the root of the source tree.
// -----------------------------------------------------------------------------
//
//  Common types + memory wrappers
//
// Author: Skal (pascal.massimino@gmail.com)

// Macro to check ABI compatibility (same major revision number)
auto WEBP_ABI_IS_INCOMPATIBLE(T0, T1)(auto ref T0 a, auto ref T1 b)
{
    return (a >> 8) != (b >> 8);
}

extern (C):

// Allocates 'size' bytes of memory. Returns NULL upon error. Memory
// must be deallocated by calling WebPFree(). This function is made available
// by the core 'libwebp' library.
void* WebPMalloc(size_t size);

// Releases memory returned by the WebPDecode*() functions (from decode.h).
void WebPFree(void* ptr);
