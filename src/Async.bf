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
	[AlwaysInclude]
	sealed abstract class Async
	{
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			CLink
		]
		public extern static int ERR_load_ASYNC_strings();

		/*
		 * ASYNC function codes.
		 */
		public const int F_ASYNC_CTX_NEW              = 100;
		public const int F_ASYNC_INIT_THREAD          = 101;
		public const int F_ASYNC_JOB_NEW              = 102;
		public const int F_ASYNC_PAUSE_JOB            = 103;
		public const int F_ASYNC_START_FUNC           = 104;
		public const int F_ASYNC_START_JOB            = 105;
		public const int F_ASYNC_WAIT_CTX_SET_WAIT_FD = 106;

		/*
		 * ASYNC reason codes.
		 */
		public const int R_FAILED_TO_SET_POOL     = 101;
		public const int R_FAILED_TO_SWAP_CONTEXT = 102;
		public const int R_INIT_FAILED            = 105;
		public const int R_INVALID_POOL_SIZE      = 103;
		
		[CRepr]
		public struct fibre_st
		{
			public void* fibre;
#if BF_PLATFORM_WINDOWS
			public int converted;
#elif BF_PLATFORM_LINUX
		    public void* env;
		    public int env_init;
#endif
		}
		public typealias fibre = fibre_st;

#if BF_PLATFORM_WINDOWS
		public typealias ASYNC_FD = void*;
#else
		public typealias ASYNC_FD = int;
#endif

		[CRepr]
		public struct job_st
		{
		    public fibre fibrectx;
		    public function int(void*) func;
		    public void* funcargs;
		    public int ret;
		    public int status;
		    public WAIT_CTX *waitctx;
		}
		public typealias JOB = job_st;
		
		[CRepr]
		public struct fd_lookup_st
		{
		    public void* key;
		    public ASYNC_FD fd;
		    public void* custom_data;
		    public function void(WAIT_CTX*, void*, ASYNC_FD, void*) cleanup;
		    public int add;
		    public int del;
		    public fd_lookup_st* next;
		}
		
		[CRepr]
		public struct wait_ctx_st
		{
			public fd_lookup_st* fds;
			public uint numadd;
			public uint numdel;
		}
		public typealias WAIT_CTX = wait_ctx_st;

		public const int ERR     = 0;
		public const int NO_JOBS = 1;
		public const int PAUSE   = 2;
		public const int FINISH  = 3;

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_init_thread")
		]
		public extern static int init_thread(uint max_size, uint init_size);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_cleanup_thread")
		]
		public extern static void cleanup_thread();

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_WAIT_CTX_new")
		]
		public extern static WAIT_CTX* WAIT_CTX_new();
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_WAIT_CTX_free")
		]
		public extern static void WAIT_CTX_free(WAIT_CTX* ctx);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_WAIT_CTX_set_wait_fd")
		]
		public extern static int WAIT_CTX_set_wait_fd(WAIT_CTX* ctx, void* key, ASYNC_FD fd, void* custom_data, function void(WAIT_CTX*, void*, ASYNC_FD, void*) cleanup);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_WAIT_CTX_get_fd")
		]
		public extern static int WAIT_CTX_get_fd(WAIT_CTX* ctx, void* key, ASYNC_FD* fd, void** custom_data);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_WAIT_CTX_get_all_fds")
		]
		public extern static int WAIT_CTX_get_all_fds(WAIT_CTX* ctx, ASYNC_FD* fd, uint* numfds);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_WAIT_CTX_get_changed_fds")
		]
		public extern static int WAIT_CTX_get_changed_fds(WAIT_CTX* ctx, ASYNC_FD* addfd, uint* numaddfds, ASYNC_FD* delfd, uint* numdelfds);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_WAIT_CTX_clear_fd")
		]
		public extern static int WAIT_CTX_clear_fd(WAIT_CTX* ctx, void* key);

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_is_capable")
		]
		public extern static int is_capable();

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_start_job")
		]
		public extern static int start_job(JOB** job, WAIT_CTX* ctx, int* ret, function int(void*) func, void* args, uint size);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_pause_job")
		]
		public extern static int pause_job();

		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_get_current_job")
		]
		public extern static JOB* get_current_job();
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_get_wait_ctx")
		]
		public extern static WAIT_CTX* get_wait_ctx(JOB* job);
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_block_pause")
		]
		public extern static void block_pause();
		[
#if !OPENSSL_LINK_STATIC
			Import(OPENSSL_LIB_CRYPTO),
#endif
			LinkName("ASYNC_unblock_pause")
		]
		public extern static void unblock_pause();
	}
}
