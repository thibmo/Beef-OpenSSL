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
	sealed abstract class Comp
	{
#if !OPENSSL_NO_COMP
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			CLink
		]
		public extern static int ERR_load_COMP_strings();
		
		/*
		 * COMP function codes.
		 */
		public const int F_BIO_ZLIB_FLUSH = 99;
		public const int F_BIO_ZLIB_NEW   = 100;
		public const int F_BIO_ZLIB_READ  = 101;
		public const int F_BIO_ZLIB_WRITE = 102;
		public const int F_COMP_CTX_NEW   = 103;
		
		/*
		 * COMP reason codes.
		 */
		public const int R_ZLIB_DEFLATE_ERROR = 99;
		public const int R_ZLIB_INFLATE_ERROR = 100;
		public const int R_ZLIB_NOT_SUPPORTED = 101;

		[CRepr]
		public struct method_st
		{
		    public int type;                                                                           /* NID for compression library */
		    public char8* name;                                                                        /* A text string to identify the library */
		    public function int(CTX* ctx) init;
		    public function void(CTX* ctx) finish;
		    public function int(CTX* ctx, uint8* outVal, uint olen, uint8* inVal, uint ilen) compress;
		    public function int(CTX* ctx, uint8* outVal, uint olen, uint8* inVal, uint ilen) expand;
		}
		public typealias CTX = ctx_st;
		
		[CRepr]
		public struct ctx_st
		{
		    public method_st* meth;
		    public uint compress_in;
		    public uint compress_out;
		    public uint expand_in;
		    public uint expand_out;
		    public void* data;
		}
		public typealias METHOD = method_st;

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("COMP_CTX_new")
		]
		public extern static CTX* CTX_new(METHOD* meth);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("COMP_CTX_get_method")
		]
		public extern static METHOD* CTX_get_method(CTX* ctx);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("COMP_CTX_get_type")
		]
		public extern static int CTX_get_type(CTX* comp);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("COMP_get_type")
		]
		public extern static int get_type(METHOD* meth);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("COMP_get_name")
		]
		public extern static char8* get_name(METHOD* meth);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("COMP_CTX_free")
		]
		public extern static void CTX_free(CTX* ctx);
		
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("COMP_compress_block")
		]
		public extern static int compress_block(CTX* ctx, uint8* outVal, int olen, uint8* inVal, int ilen);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("COMP_expand_block")
		]
		public extern static int expand_block(CTX* ctx, uint8* outVal, int olen, uint8* inVal, int ilen);
		
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("COMP_zlib")
		]
		public extern static METHOD* zlib();
		
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void zlib_cleanup() { while(false) continue; }
#endif
	}
}
