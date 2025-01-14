#
# A central makefile (Rocks wide) to specify the version of
# Python we are using.
#
# Unlike version.mk variables, this can be used by both Ganglia,
# contrib, and Rocks packages.
#

# So the contents are only evaluated once.
ifndef __PYTHON_MK
__PYTHON_MK = yes

-include $(ROCKSROOT)/etc/rocks-version-common.mk
include rocks-version-common.mk

ifeq ($(strip $(VERSION.MAJOR)), 5)
PY.VERSION	= 2.4
endif
ifeq ($(strip $(VERSION.MAJOR)), 6)
PY.VERSION	= 2.6
endif
ifeq ($(strip $(VERSION.MAJOR)), 7)
PY.VERSION	= 2.7
endif
PY.PATH		= /opt/rocks/bin/python
ifeq ($(strip $(VERSION.MAJOR)), 8)
PY.VERSION	= 3.10
PY.PATH		= /opt/rocks/bin/python3
endif
PY.LIB		= python$(PY.VERSION)
PY.ROCKS	= /opt/rocks/lib/$(PY.LIB)/site-packages/



# Copy this file into the tarball release

python.mk: $(wildcard $(ROCKSROOT)/etc/python.mk)
	cp $^ $@

clean::
	rm -f python.mk


endif	#__PYTHON_MK
