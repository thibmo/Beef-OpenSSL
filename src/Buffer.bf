/*
* Generated by util/mkerr.pl DO NOT EDIT
* Copyright 1995-2019 The OpenSSL Project Authors. All Rights Reserved.
*
* Licensed under the OpenSSL license (the "License").  You may not use
* this file except in compliance with the License.  You can obtain a copy
* in the file LICENSE in the source distribution or at
* https://www.openssl.org/source/license.html
*/
using System;

namespace Beef_OpenSSL
{
	sealed abstract class Buffer
	{
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			CLink
		]
		public extern static int ERR_load_BUF_strings();

		/*
		 * BUF function codes.
		 */
		public const int F_BUF_MEM_GROW       = 100;
		public const int F_BUF_MEM_GROW_CLEAN = 105;
		public const int F_BUF_MEM_NEW        = 101;
		
		/*
		 * BUF reason codes.
		 */
		/* These names are outdated as of OpenSSL 1.1; a future release will move them to be deprecated. */
		[Inline]
		public static char8* strdup(char8* str) => OpenSSL.strdup(str);
		[Inline]
		public static char8* strndup(char8* str, uint size) => OpenSSL.strndup(str, size);
		[Inline]
		public static void* memdup(void* data, uint size) => OpenSSL.memdup(data, size);
		[Inline]
		public static uint strlcpy(char8* dst, char8* src, uint size) => OpenSSL.strlcpy(dst, src, size);
		[Inline]
		public static uint strlcat(char8* dst, char8* src, uint size) => OpenSSL.strlcat(dst, src, size);
		[Inline]
		public static uint strnlen(char8* str, uint maxlen) => OpenSSL.strnlen(str, maxlen);

		[CRepr]
		public struct mem_st
		{
		    public uint length; /* current number of bytes */
		    public char8* data;
		    public uint max;    /* size of buffer */
		    public uint flags;
		}
		public typealias MEM = mem_st;
		
		public const int MEM_FLAG_SECURE = 0x01;
		
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("BUF_MEM_new")
		]
		public extern static MEM* MEM_new();
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("BUF_MEM_new_ex")
		]
		public extern static MEM* MEM_new_ex(uint flags);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("BUF_MEM_free")
		]
		public extern static void MEM_free(MEM* a);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("BUF_MEM_grow")
		]
		public extern static uint MEM_grow(MEM* str, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("BUF_MEM_grow_clean")
		]
		public extern static uint MEM_grow_clean(MEM* str, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("BUF_reverse")
		]
		public extern static void reverse(uint8* outVal, uint8* inVal, uint siz);
	}
}
