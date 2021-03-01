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
	sealed abstract class Whirlpool
	{
#if !OPENSSL_NO_WHIRLPOOL
		public const int DIGEST_LENGTH = 512 / 8;
		public const int BBLOCK        = 512;
		public const int COUNTER       = 256 / 8;
		
		public struct ctx_st
		{
		    public h_struct H;
		    public uint8[BBLOCK / 8] data;
		    public uint bitoff;
		    public uint[COUNTER / sizeof(uint)] bitlen;

			[CRepr, Union]
			public struct h_struct
			{
			    public uint8[DIGEST_LENGTH] c;
			    /* double q is here to ensure 64-bit alignment */
			    public double[DIGEST_LENGTH / sizeof(double)] q;
			}
		}
		typealias CTX = ctx_st;
		
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("WHIRLPOOL_Init")
		]
		public extern static int Init(CTX* c);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("WHIRLPOOL_Update")
		]
		public extern static int Update(CTX* c, void* inp, uint bytes);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("WHIRLPOOL_BitUpdate")
		]
		public extern static void BitUpdate(CTX* c, void* inp, uint bits);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("WHIRLPOOL_Final")
		]
		public extern static int Final(uint8* md, CTX* c);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			CLink
		]
		public extern static uint8* WHIRLPOOL(void* inp, uint bytes, uint8* md);
#endif
	}
}