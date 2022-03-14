NAME	= foundation-cython
RELEASE = 2
RPM.EXTRAS="%define _python_bytecompile_errors_terminate_build 0"

ifeq ($(strip $(VERSION.MAJOR)), 7)
EXTRAFILES = "\\n/opt/rocks/share/man/man1/*\\n/opt/rocks/lib/[a-oq-zA-Z]*"
else
EXTRAFILES = 
endif

RPM.FILES = "/opt/rocks/bin/*\\n/opt/rocks/lib/python3*/*"

RPM.FILES += $(EXTRAFILES)
