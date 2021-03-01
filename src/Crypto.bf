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
	sealed abstract class Crypto
	{
		/*-------------------------------------------------------------------------------
		** cryptoerr.h
		*/
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			CLink
		]
		public extern static int ERR_load_CRYPTO_strings();

		public typealias REF_COUNT = int;

		/*
		 * CRYPTO function codes.
		 */
		public const int F_CMAC_CTX_NEW            = 120;
		public const int F_CRYPTO_DUP_EX_DATA      = 110;
		public const int F_CRYPTO_FREE_EX_DATA     = 111;
		public const int F_CRYPTO_GET_EX_NEW_INDEX = 100;
		public const int F_CRYPTO_MEMDUP           = 115;
		public const int F_CRYPTO_NEW_EX_DATA      = 112;
		public const int F_CRYPTO_OCB128_COPY_CTX  = 121;
		public const int F_CRYPTO_OCB128_INIT      = 122;
		public const int F_CRYPTO_SET_EX_DATA      = 102;
		public const int F_FIPS_MODE_SET           = 109;
		public const int F_GET_AND_LOCK            = 113;
		public const int F_OPENSSL_ATEXIT          = 114;
		public const int F_OPENSSL_BUF2HEXSTR      = 117;
		public const int F_OPENSSL_FOPEN           = 119;
		public const int F_OPENSSL_HEXSTR2BUF      = 118;
		public const int F_OPENSSL_INIT_CRYPTO     = 116;
		public const int F_OPENSSL_LH_NEW          = 126;
		public const int F_OPENSSL_SK_DEEP_COPY    = 127;
		public const int F_OPENSSL_SK_DUP          = 128;
		public const int F_PKEY_HMAC_INIT          = 123;
		public const int F_PKEY_POLY1305_INIT      = 124;
		public const int F_PKEY_SIPHASH_INIT       = 125;
		public const int F_SK_RESERVE              = 129;
		
		/*
		 * CRYPTO reason codes.
		 */
		public const int R_FIPS_MODE_NOT_SUPPORTED = 101;
		public const int R_ILLEGAL_HEX_DIGIT       = 102;
		public const int R_ODD_NUMBER_OF_DIGITS    = 103;
		
		/*-------------------------------------------------------------------------------
		** crypto.h
		*/
		/* Old type for allocating dynamic locks. No longer used. Use the new thread API instead. */
		[CRepr]
		public struct dynloc
		{
		    public int dummy;
		}

		public typealias RWLOCK = void;

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_lock_new")
		]
		public extern static RWLOCK* THREAD_lock_new();
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_read_lock")
		]
		public extern static int THREAD_read_lock(RWLOCK* lock);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_write_lock")
		]
		public extern static int THREAD_write_lock(RWLOCK* lock);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_unlock")
		]
		public extern static int THREAD_unlock(RWLOCK* lock);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_lock_free")
		]
		public extern static void THREAD_lock_free(RWLOCK* lock);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_atomic_add")
		]
		public extern static int atomic_add(int* val, int amount, int* ret, RWLOCK* lock);
		
		/* The following can be used to detect memory leaks in the library. If used, it turns on malloc checking */
		public const int MEM_CHECK_OFF     = 0x0; /* Control only */
		public const int MEM_CHECK_ON      = 0x1; /* Control and mode bit */
		public const int MEM_CHECK_ENABLE  = 0x2; /* Control and mode bit */
		public const int MEM_CHECK_DISABLE = 0x3; /* Control only */
		
		public typealias stack_st_void = void; // For now we'll ignore the Macro-madness
		[CRepr]
		public struct ex_data_st
		{
			public stack_st_void* sk;
		}
		public typealias EX_DATA = ex_data_st;
		
		/* Per class, we have a STACK of function pointers. */
		public const int EX_INDEX_SSL            = 0;
		public const int EX_INDEX_SSL_CTX        = 1;
		public const int EX_INDEX_SSL_SESSION    = 2;
		public const int EX_INDEX_X509           = 3;
		public const int EX_INDEX_X509_STORE     = 4;
		public const int EX_INDEX_X509_STORE_CTX = 5;
		public const int EX_INDEX_DH             = 6;
		public const int EX_INDEX_DSA            = 7;
		public const int EX_INDEX_EC_KEY         = 8;
		public const int EX_INDEX_RSA            = 9;
		public const int EX_INDEX_ENGINE         = 10;
		public const int EX_INDEX_UI             = 11;
		public const int EX_INDEX_BIO            = 12;
		public const int EX_INDEX_APP            = 13;
		public const int EX_INDEX_UI_METHOD      = 14;
		public const int EX_INDEX_DRBG           = 15;
		public const int EX_INDEX__COUNT         = 16;

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_mem_ctrl")
		]
		public extern static int mem_ctrl(int mode);
		
		public function void EX_new(void* parent, void* ptr, EX_DATA* ad, int idx, int argl, void* argp);
		public function void EX_free(void* parent, void* ptr, EX_DATA* ad, int idx, int argl, void* argp);
		public function int EX_dup(EX_DATA* to, EX_DATA* from, void* from_d, int idx, int argl, void* argp);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_get_ex_new_index")
		]
		public extern static int get_ex_new_index(int class_index, int argl, void* argp, EX_new new_func, EX_dup dup_func, EX_free free_func);

		/* No longer use an index. */
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_free_ex_index")
		]
		public extern static int free_ex_index(int class_index, int idx);

		/* Initialise/duplicate/free EX_DATA variables corresponding to a given class (invokes whatever per-class callbacks are applicable) */
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_new_ex_data")
		]
		public extern static int new_ex_data(int class_index, void* obj, EX_DATA* ad);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_dup_ex_data")
		]
		public extern static int dup_ex_data(int class_index, EX_DATA* to, EX_DATA* from);
		
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_free_ex_data")
		]
		public extern static void free_ex_data(int class_index, void* obj, EX_DATA* ad);
		
		/* Get/set data in a EX_DATA variable corresponding to a particular index (relative to the class type involved) */
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_set_ex_data")
		]
		public extern static int set_ex_data(EX_DATA* ad, int idx, void* val);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_get_ex_data")
		]
		public extern static void* get_ex_data(EX_DATA* ad, int idx);
		
		/* This function cleans up all "ex_data" state. It mustn't be called under potential race-conditions. */
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void cleanup_all_ex_data() { while(false) continue; }
		
		/*
		 * The old locking functions have been removed completely without compatibility macros. This is because the old functions either could not properly report errors, or the returned error values were not clearly documented.
		 * Replacing the locking functions with no-ops would cause race condition issues in the affected applications. It is far better for them to fail at compile time.
		 * On the other hand, the locking callbacks are no longer used.  Consequently, the callback management functions can be safely replaced with no-op macros.
		 */
		[Inline, Obsolete("No longer available, no-op", true)]
		public static int num_locks() => 1;
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void set_locking_callback(void* func) {}
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void* get_locking_callback() => null;
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void set_add_lock_callback(void* func) {}
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void* get_add_lock_callback() => null;
		
		/* These defines where used in combination with the old locking callbacks, they are not called anymore, but old code that's not called might still use them. */
		public static int LOCK   = 1;
		public static int UNLOCK = 2;
		public static int READ   = 4;
		public static int WRITE  = 8;
		
		/* This structure is no longer used */
		[CRepr]
		public struct threadid_st
		{
		    public int dummy;
		}
		public typealias THREADID = threadid_st;
		/* Only use THREADID_set_[numeric|pointer]() within callbacks */
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void THREADID_set_numeric(uint id, int val) {}
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void THREADID_set_pointer(uint id, void* ptr) {}
		[Inline, Obsolete("No longer available, no-op", true)]
		public static int THREADID_set_callback(void* threadid_func) => 0;
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void* THREADID_get_callback() => null;
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void THREADID_current(uint id) {}
		[Inline, Obsolete("No longer available, no-op", true)]
		public static int THREADID_cmp(void* a, void* b) => -1;
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void THREADID_cpy(void* dest, void* src) {}
		[Inline, Obsolete("No longer available, no-op", true)]
		public static uint THREADID_hash(uint id) => 0UL;
		
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void set_id_callback(void* func) {}
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void* get_id_callback() => null;
		[Inline, Obsolete("No longer available, no-op", true)]
		public static uint thread_id() => 0UL;
		
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void set_dynlock_create_callback(void* dyn_create_function) {}
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void set_dynlock_lock_callback(void* dyn_lock_function) {}
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void set_dynlock_destroy_callback(void* dyn_destroy_function) {}
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void* get_dynlock_create_callback() => null;
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void* get_dynlock_lock_callback() => null;
		[Inline, Obsolete("No longer available, no-op", true)]
		public static void* get_dynlock_destroy_callback() => null;

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_set_mem_functions")
		]
		public extern static int set_mem_functions(function void*(uint, char8*, int) m, function void*(void*, uint, char8*, int) r, function void(void*, char8*, int) f);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_set_mem_debug")
		]
		public extern static int set_mem_debug(int flag);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_get_mem_functions")
		]
		public extern static void get_mem_functions(function void*(uint, char8*, int)* m, function void*(void*, uint, char8*, int)* r, function void(void*, char8*, int)* f);
		
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_malloc")
		]
		public extern static void* malloc(uint num, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_zalloc")
		]
		public extern static void* zalloc(uint num, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_memdup")
		]
		public extern static void* memdup(void* data, uint size, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_strdup")
		]
		public extern static char8* strdup(char8* str, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_strndup")
		]
		public extern static char8* strndup(char8* str, uint size, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_free")
		]
		public extern static void free(void* ptr, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_clear_free")
		]
		public extern static void clear_free(void* ptr, uint num, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_realloc")
		]
		public extern static void* realloc(void* addr, uint num, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_clear_realloc")
		]
		public extern static void* clear_realloc(void* addr, uint old_num, uint num, char8* file, int line);
		
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_secure_malloc_init")
		]
		public extern static int secure_malloc_init(uint size, int minsize);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_secure_malloc_done")
		]
		public extern static int secure_malloc_done();
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_secure_malloc")
		]
		public extern static void* secure_malloc(uint num, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_secure_zalloc")
		]
		public extern static void* secure_zalloc(uint num, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_secure_free")
		]
		public extern static void secure_free(void* ptr, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_secure_clear_free")
		]
		public extern static void secure_clear_free(void* ptr, uint num, char8* file, int line);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_secure_allocated")
		]
		public extern static int secure_allocated(void* ptr);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_secure_malloc_initialized")
		]
		public extern static int secure_malloc_initialized();
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_secure_actual_size")
		]
		public extern static uint secure_actual_size(void* ptr);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_secure_used")
		]
		public extern static uint secure_used();

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			CLink
		]
		public extern static int FIPS_mode();
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			CLink
		]
		public extern static int FIPS_mode_set(int r);

		/*
		 * memcmp returns zero iff the |len| bytes at |a| and |b| are equal. It takes an amount of time dependent on |len|, but independent of the contents of |a| and |b|.
		 * Unlike memcmp, it cannot be used to put elements into a defined order as the return value when a != b is undefined, other than to be non-zero.
		 */
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_memcmp")
		]
		public extern static int memcmp(void* in_a, void* in_b, uint len);

		public typealias ONCE = uint;
		public typealias THREAD_LOCAL = uint;
		public typealias THREAD_ID = uint;
		
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_run_once")
		]
		public extern static int THREAD_run_once(ONCE* once, function void() init);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_init_local")
		]
		public extern static int THREAD_init_local(THREAD_LOCAL* key, function void(void*) cleanup);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_get_local")
		]
		public extern static void*THREAD_get_local(THREAD_LOCAL* key);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_set_local")
		]
		public extern static int THREAD_set_local(THREAD_LOCAL* key, void* val);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_cleanup_local")
		]
		public extern static int THREAD_cleanup_local(THREAD_LOCAL* key);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_get_current_id")
		]
		public extern static THREAD_ID THREAD_get_current_id();
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_THREAD_compare_id")
		]
		public extern static int THREAD_compare_id(THREAD_ID a, THREAD_ID b);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_cbc128_encrypt")
		]
		public extern static void cbc128_encrypt(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_cbc128_decrypt")
		]
		public extern static void cbc128_decrypt(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, Modes.block128_f block);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ctr128_encrypt")
		]
		public extern static void ctr128_encrypt(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, uint8[16] ecount_buf, uint* num, Modes.block128_f block);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ctr128_encrypt_ctr32")
		]
		public extern static void ctr128_encrypt_ctr32(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, uint8[16] ecount_buf, uint* num, Modes.ctr128_f ctr);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ofb128_encrypt")
		]
		public extern static void ofb128_encrypt(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, int* num, Modes.block128_f block);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_cfb128_encrypt")
		]
		public extern static void cfb128_encrypt(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, int* num, int enc, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_cfb128_8_encrypt")
		]
		public extern static void cfb128_8_encrypt(uint8* inVal, uint8* outVal, uint length, void* key, uint8[16] ivec, int* num, int enc, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_cfb128_1_encrypt")
		]
		public extern static void cfb128_1_encrypt(uint8* inVal, uint8* outVal, uint bits, void* key, uint8[16] ivec, int* num, int enc, Modes.block128_f block);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_cts128_encrypt_block")
		]
		public extern static uint cts128_encrypt_block(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_cts128_encrypt")
		]
		public extern static uint cts128_encrypt(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, Modes.cbc128_f cbc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_cts128_decrypt_block")
		]
		public extern static uint cts128_decrypt_block(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_cts128_decrypt")
		]
		public extern static uint cts128_decrypt(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, Modes.cbc128_f cbc);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_nistcts128_encrypt_block")
		]
		public extern static uint nistcts128_encrypt_block(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_nistcts128_encrypt")
		]
		public extern static uint nistcts128_encrypt(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, Modes.cbc128_f cbc);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_nistcts128_decrypt_block")
		]
		public extern static uint nistcts128_decrypt_block(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_nistcts128_decrypt")
		]
		public extern static uint nistcts128_decrypt(uint8* inVal, uint8* outVal, uint len, void* key, uint8[16] ivec, Modes.cbc128_f cbc);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_new")
		]
		public extern static Modes.GCM128_CONTEXT* gcm128_new(void* key, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_init")
		]
		public extern static void gcm128_init(Modes.GCM128_CONTEXT* ctx, void* key, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_setiv")
		]
		public extern static void gcm128_setiv(Modes.GCM128_CONTEXT* ctx, uint8* iv, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_aad")
		]
		public extern static int gcm128_aad(Modes.GCM128_CONTEXT* ctx, uint8* aad, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_encrypt")
		]
		public extern static int gcm128_encrypt(Modes.GCM128_CONTEXT* ctx, uint8* inVal, uint8* outVal, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_decrypt")
		]
		public extern static int gcm128_decrypt(Modes.GCM128_CONTEXT* ctx, uint8* inVal, uint8* outVal, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_encrypt_ctr32")
		]
		public extern static int gcm128_encrypt_ctr32(Modes.GCM128_CONTEXT* ctx, uint8* inVal, uint8* outVal, uint len, Modes.ctr128_f stream);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_decrypt_ctr32")
		]
		public extern static int gcm128_decrypt_ctr32(Modes.GCM128_CONTEXT* ctx, uint8* inVal, uint8* outVal, uint len, Modes.ctr128_f stream);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_finish")
		]
		public extern static int gcm128_finish(Modes.GCM128_CONTEXT* ctx, uint8* tag, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_tag")
		]
		public extern static void gcm128_tag(Modes.GCM128_CONTEXT* ctx, uint8* tag, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_gcm128_release")
		]
		public extern static void gcm128_release(Modes.GCM128_CONTEXT* ctx);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ccm128_init")
		]
		public extern static void ccm128_init(Modes.CCM128_CONTEXT* ctx, uint M, uint L, void* key, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ccm128_setiv")
		]
		public extern static int ccm128_setiv(Modes.CCM128_CONTEXT* ctx, uint8* nonce, uint nlen, uint mlen);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ccm128_aad")
		]
		public extern static void ccm128_aad(Modes.CCM128_CONTEXT* ctx, uint8* aad, uint alen);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ccm128_encrypt")
		]
		public extern static int ccm128_encrypt(Modes.CCM128_CONTEXT* ctx, uint8* inp, uint8* outVal, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ccm128_decrypt")
		]
		public extern static int ccm128_decrypt(Modes.CCM128_CONTEXT* ctx, uint8* inp, uint8* outVal, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ccm128_encrypt_ccm64")
		]
		public extern static int ccm128_encrypt_ccm64(Modes.CCM128_CONTEXT* ctx, uint8* inp, uint8* outVal, uint len, Modes.ccm128_f stream);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ccm128_decrypt_ccm64")
		]
		public extern static int ccm128_decrypt_ccm64(Modes.CCM128_CONTEXT* ctx, uint8* inp, uint8* outVal, uint len, Modes.ccm128_f stream);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ccm128_tag")
		]
		public extern static uint ccm128_tag(Modes.CCM128_CONTEXT* ctx, uint8* tag, uint len);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_xts128_encrypt")
		]
		public extern static int xts128_encrypt(Modes.XTS128_CONTEXT* ctx, uint8[16] iv, uint8* inp, uint8* outVal, uint len, int enc);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_128_wrap")
		]
		public extern static uint _128_wrap(void* key, uint8* iv, uint8* outVal, uint8* inVal, uint inlen, Modes.block128_f block);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_128_unwrap")
		]
		public extern static uint _128_unwrap(void* key, uint8* iv, uint8* outVal, uint8* inVal, uint inlen, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_128_wrap_pad")
		]
		public extern static uint _128_wrap_pad(void* key, uint8* icv, uint8* outVal, uint8* inVal, uint inlen, Modes.block128_f block);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_128_unwrap_pad")
		]
		public extern static uint _128_unwrap_pad(void* key, uint8* icv, uint8* outVal, uint8* inVal, uint inlen, Modes.block128_f block);

#if !OPENSSL_NO_OCB
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ocb128_new")
		]
		public extern static Modes.OCB128_CONTEXT* ocb128_new(void* keyenc, void* keydec, Modes.block128_f encrypt, Modes.block128_f decrypt, Modes.ocb128_f stream);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ocb128_init")
		]
		public extern static int ocb128_init(Modes.OCB128_CONTEXT* ctx, void* keyenc, void* keydec, Modes.block128_f encrypt, Modes.block128_f decrypt, Modes.ocb128_f stream);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ocb128_copy_ctx")
		]
		public extern static int ocb128_copy_ctx(Modes.OCB128_CONTEXT* dest, Modes.OCB128_CONTEXT* src, void* keyenc, void* keydec);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ocb128_setiv")
		]
		public extern static int ocb128_setiv(Modes.OCB128_CONTEXT* ctx, uint8* iv, uint len, uint taglen);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ocb128_aad")
		]
		public extern static int ocb128_aad(Modes.OCB128_CONTEXT* ctx, uint8* aad, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ocb128_encrypt")
		]
		public extern static int ocb128_encrypt(Modes.OCB128_CONTEXT* ctx, uint8* inVal, uint8* outVal, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ocb128_decrypt")
		]
		public extern static int ocb128_decrypt(Modes.OCB128_CONTEXT* ctx, uint8* inVal, uint8* outVal, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ocb128_finish")
		]
		public extern static int ocb128_finish(Modes.OCB128_CONTEXT* ctx, uint8* tag, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ocb128_tag")
		]
		public extern static int ocb128_tag(Modes.OCB128_CONTEXT* ctx, uint8* tag, uint len);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("CRYPTO_ocb128_cleanup")
		]
		public extern static void ocb128_cleanup(Modes.OCB128_CONTEXT* ctx);
#endif
	}
}