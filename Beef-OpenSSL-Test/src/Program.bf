using System;
using Beef_OpenSSL;

namespace Beef_OpenSSL_Test
{
	class Program
	{
		static int Main()
		{
			OpenSSL.init();
			String tmp = scope:: .(AES.options());
			tmp.Append("\n\nOpenSSL.VERSION     = ");
			tmp.Append(OpenSSL.version(OpenSSL.VERSION));
			tmp.Append("\nOpenSSL.CFLAGS      = ");
			tmp.Append(OpenSSL.version(OpenSSL.CFLAGS));
			tmp.Append("\nOpenSSL.BUILT_ON    = ");
			tmp.Append(OpenSSL.version(OpenSSL.BUILT_ON));
			tmp.Append("\nOpenSSL.PLATFORM    = ");
			tmp.Append(OpenSSL.version(OpenSSL.PLATFORM));
			tmp.Append("\nOpenSSL.DIR         = ");
			tmp.Append(OpenSSL.version(OpenSSL.DIR));
			tmp.Append("\nOpenSSL.ENGINES_DIR = ");
			tmp.Append(OpenSSL.version(OpenSSL.ENGINES_DIR));
			Console.Out.WriteLine(tmp);

			Console.Out.WriteLine("\nPress [Enter]  to exit...");
			Console.In.Read();
			OpenSSL.cleanup();
			return 0;
		}
	}
}
