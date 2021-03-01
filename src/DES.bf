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
	sealed abstract class DES
	{
#if !OPENSSL_NO_DES
		public typealias LONG = uint;

		public typealias cblock = uint8[8];
		public typealias const_cblock = uint8[8];

		[CRepr]
		public struct ks_st
		{
		    public ks_struct[16] ks;
			
			[CRepr, Union]
			public struct ks_struct
			{
		        public cblock cblock;
		        /* make sure things are correct size on machines with 8 byte longs */
		        public LONG[2] deslong;
			}
		}
		public typealias ks = ks_st;
		public typealias key_schedule = ks_st;

		public const int KEY_SZ      = sizeof(cblock);
		public const int SCHEDULE_SZ = sizeof(key_schedule);

		public const int ENCRYPT   = 1;
		public const int DECRYPT   = 0;

		public const int CBC_MODE  = 0;
		public const int PCBC_MODE = 1;

		[Inline]
		public static void ecb2_encrypt(const_cblock* input, cblock* output, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3, int enc) => ecb3_encrypt(input, output, ks1, ks2, ks3, enc);
		
		[Inline]
		public static void ede2_cbc_encrypt(uint8* input, uint8* output, int length, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3, cblock* ivec, int enc) =>
			ede3_cbc_encrypt(input, output, length, ks1, ks2, ks3, ivec, enc);
		
		[Inline]
		public static void ede2_cfb64_encrypt(uint8* inVal, uint8* outVal, int length, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3, cblock* ivec, int* num, int enc) =>
			ede3_cfb64_encrypt(inVal, outVal, length, ks1, ks2, ks3, ivec, num, enc);
		
		[Inline]
		public static void ede2_ofb64_encrypt(uint8* inVal, uint8* outVal, int length, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3, cblock* ivec, int* num) =>
			ede3_ofb64_encrypt(inVal, outVal, length, ks1, ks2, ks3, ivec, num);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			CLink
		]
		public extern static int* _shadow_DES_check_key(); /* defaults to false */
		[Inline]
		public static int* check_key() => _shadow_DES_check_key();

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_options")
		]
		public extern static char8* options();
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_ecb3_encrypt")
		]
		public extern static void ecb3_encrypt(const_cblock* input, cblock* output, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3, int enc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_cbc_cksum")
		]
		public extern static LONG cbc_cksum(uint8* input, cblock* output, int length, key_schedule* schedule, const_cblock* ivec);
		/* DES_cbc_encrypt does not update the IV!  Use DES_ncbc_encrypt instead. */
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_cbc_encrypt")
		]
		public extern static void cbc_encrypt(uint8* input, uint8* output, int length, key_schedule* schedule, cblock* ivec, int enc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_ncbc_encrypt")
		]
		public extern static void ncbc_encrypt(uint8* input, uint8* output, int length, key_schedule* schedule, cblock* ivec, int enc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_xcbc_encrypt")
		]
		public extern static void xcbc_encrypt(uint8* input, uint8* output, int length, key_schedule* schedule, cblock* ivec, const_cblock* inw, const_cblock* outw, int enc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_cfb_encrypt")
		]
		public extern static void cfb_encrypt(uint8* inVal, uint8* outVal, int numbits, int length, key_schedule* schedule, cblock* ivec, int enc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_ecb_encrypt")
		]
		public extern static void ecb_encrypt(const_cblock* input, cblock* output, key_schedule* ks, int enc);
		
		/*
		 * This is the DES encryption function that gets called by just about every other DES routine in the library.
		 * You should not use this function except to implement 'modes' of DES.  I say this because the functions that call this routine do the conversion from 'char8*' to long, and this needs to be
		 * done to make sure 'non-aligned' memory access do not occur.  The characters are loaded 'little endian'. Data is a pointer to 2 unsigned long's and ks is the DES_key_schedule to use.  enc, is non zero specifies
		 * encryption, zero if decryption.
		 */
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_encrypt1")
		]
		public extern static void encrypt1(LONG* data, key_schedule* ks, int enc);
		
		/*
		 * This functions is the same as encrypt1() except that the DES initial permutation (IP) and final permutation (FP) have been left out.
		 * As for encrypt1(), you should not use this function. It is used by the routines in the library that implement triple DES. IP() encrypt2() encrypt2() encrypt2() FP()
		 * is the same as encrypt1() encrypt1() encrypt1() except faster :-).
		 */
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_encrypt2")
		]
		public extern static void encrypt2(LONG* data, key_schedule* ks, int enc);
		
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_encrypt3")
		]
		public extern static void encrypt3(LONG* data, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_decrypt3")
		]
		public extern static void decrypt3(LONG* data, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_ede3_cbc_encrypt")
		]
		public extern static void ede3_cbc_encrypt(uint8* input, uint8* output, int length, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3, cblock* ivec, int enc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_ede3_cfb64_encrypt")
		]
		public extern static void ede3_cfb64_encrypt(uint8* inVal, uint8* outVal, int length, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3, cblock* ivec, int* num, int enc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_ede3_cfb_encrypt")
		]
		public extern static void ede3_cfb_encrypt(uint8* inVal, uint8* outVal, int numbits, int length, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3, cblock* ivec, int enc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_ede3_ofb64_encrypt")
		]
		public extern static void ede3_ofb64_encrypt(uint8* inVal, uint8* outVal, int length, key_schedule* ks1, key_schedule* ks2, key_schedule* ks3, cblock* ivec, int* num);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_fcrypt")
		]
		public extern static char8* fcrypt(char8* buf, char8* salt, char8* ret);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_crypt")
		]
		public extern static char8* crypt(char8* buf, char8* salt);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_ofb_encrypt")
		]
		public extern static void ofb_encrypt(uint8* inVal, uint8* outVal, int numbits, int length, key_schedule* schedule, cblock* ivec);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_pcbc_encrypt")
		]
		public extern static void pcbc_encrypt(uint8* input, uint8* output, int length, key_schedule* schedule, cblock* ivec, int enc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_quad_cksum")
		]
		public extern static LONG quad_cksum(uint8* input, cblock[] output, int length, int out_count, cblock* seed);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_random_key")
		]
		public extern static int random_key(cblock* ret);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_set_odd_parity")
		]
		public extern static void set_odd_parity(cblock* key);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_check_key_parity")
		]
		public extern static int check_key_parity(const_cblock* key);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_is_weak_key")
		]
		public extern static int is_weak_key(const_cblock* key);
		/* set_key (= set_key = key_sched = key_sched) calls set_key_checked if global variable check_key is set, set_key_unchecked otherwise. */
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_set_key")
		]
		public extern static int set_key(const_cblock* key, key_schedule* schedule);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_key_sched")
		]
		public extern static int key_sched(const_cblock* key, key_schedule* schedule);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_set_key_checked")
		]
		public extern static int set_key_checked(const_cblock* key, key_schedule* schedule);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_set_key_unchecked")
		]
		public extern static void set_key_unchecked(const_cblock* key, key_schedule* schedule);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_string_to_key")
		]
		public extern static void string_to_key(char8* str, cblock* key);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_string_to_2keys")
		]
		public extern static void string_to_2keys(char8* str, cblock* key1, cblock* key2);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_cfb64_encrypt")
		]
		public extern static void cfb64_encrypt(uint8* inVal, uint8* outVal, int length, key_schedule* schedule, cblock* ivec, int* num, int enc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("DES_ofb64_encrypt")
		]
		public extern static void ofb64_encrypt(uint8* inVal, uint8* outVal, int length, key_schedule* schedule, cblock* ivec, int* num);
		
		[Inline]
		public static void fixup_key_parity(cblock* key) => set_odd_parity(key);
#endif
	}
}