NAME	= foundation-python
CONFIGOPTS = --enable-ipv6 --enable-unicode=ucs4
RELEASE = 0
ifeq ($(strip $(VERSION.MAJOR)), 5)
VERSION = 2.4.3
RELEASE = 0
ADDFLAGS = 
endif
ifeq ($(strip $(VERSION.MAJOR)), 6)
VERSION = 2.6.7
RELEASE = 0
ADDFLAGS = "CFLAGS=-fPIC"
#CONFIGOPTS += --exec-prefix=$(PKGROOT)
endif 
ifeq ($(strip $(VERSION.MAJOR)), 7)
VERSION = 2.7.5
RELEASE = 0
ADDFLAGS = "CFLAGS=-fPIC"
#RPM.EXTRAS="%define _python_bytecompile_errors_terminate_build 0\\n%define __python_requires  %{_builddir}/%{name}-%{version}/filter_python_requires.sh"
#CONFIGOPTS += --exec-prefix=$(PKGROOT)
endif 
RPM.FILES = "/opt/rocks/bin/*\\n/opt/rocks/include/python2*\\n/opt/rocks/lib/lib*\\n/opt/rocks/lib/python2*\\n/opt/rocks/share/man/man1/*\\n/opt/rocks/usr/bin/*"
ifeq ($(strip $(VERSION.MAJOR)), 7)
RPM.FILES += "\\n/opt/rocks/lib/pkgconfig/*"
endif 
ifeq ($(strip $(VERSION.MAJOR)), 8)
VERSION = 3.10.2
RELEASE = 0
ADDFLAGS = "CFLAGS=-fPIC"
RPM.PROVIDES ="/usr/local/bin/python"
#RPM.EXTRAS="%define _python_bytecompile_errors_terminate_build 0\\n%define __python_requires  %{_builddir}/%{name}-%{version}/filter_python_requires.sh"
#CONFIGOPTS += --exec-prefix=$(PKGROOT)
endif
RPM.FILES = "/opt/rocks/bin/*\\n/opt/rocks/include/python3*\\n/opt/rocks/lib/lib*\\n/opt/rocks/lib/python3*\\n/opt/rocks/share/man/man1/*\\n/opt/rocks/usr/bin/*"
ifeq ($(strip $(VERSION.MAJOR)), 8)
RPM.FILES += "\\n/opt/rocks/lib/pkgconfig/*"
endif

