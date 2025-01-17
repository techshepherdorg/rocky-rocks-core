# --------------------------------------------------- -*- Makefile -*- --
# $Id: pexpect.mk,v 1.12 2012/11/27 00:48:36 phil Exp $
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 6.2 (SideWinder)
# 		         version 7.0 (Manzanita)
# 
# Copyright (c) 2000 - 2017 The Regents of the University of California.
# All rights reserved.	
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided 
# with the distribution.
# 
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement: 
# 
# 	"This product includes software developed by the Rocks(r)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
# 
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of 
# the associated name, interested parties should contact Technology 
# Transfer & Intellectual Property Services, University of California, 
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910, 
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
# 
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# @Copyright@
#
# $Log: pexpect.mk,v $
# Revision 1.12  2012/11/27 00:48:36  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.11  2012/05/06 05:48:43  phil
# Copyright Storm for Mamba
#
# Revision 1.10  2011/07/23 02:30:45  phil
# Viper Copyright
#
# Revision 1.9  2010/09/07 23:53:06  bruno
# star power for gb
#
# Revision 1.8  2009/05/01 19:07:06  mjk
# chimi con queso
#
# Revision 1.7  2008/10/18 00:56:00  mjk
# copyright 5.1
#
# Revision 1.6  2008/03/06 23:41:43  mjk
# copyright storm on
#
# Revision 1.5  2007/06/23 04:03:23  mjk
# mars hill copyright
#
# Revision 1.4  2006/12/06 00:20:21  anoop
# All the Makefiles get a bit of an overhaul
#
# $(INSTALL) is used instead of install
# $(MAKE) is used instead of make or gmake
# $(TAR) is used instead of tar of gtar
#
# The mode argument for the $(INSTALL) command needs to be numeric and
# follow the convention of
#
# install [-cs] [-g group] [-m mode] [-o owner] file ...  destination
# install  -d   [-g group] [-m mode] [-o owner] dir
#
# This is portable across solaris and linux.
#
# Finally "tar xzf $TARFILE.tar.gz" is replaced with "gunzip -c $TARFILE.tar.gz | tar -xf -"
# This is again done for portability.
#
# This needs to be the convention from now on.
#
# Revision 1.3  2006/09/11 22:47:14  mjk
# monkey face copyright
#
# Revision 1.2  2006/08/10 00:09:36  mjk
# 4.2 copyright
#
# Revision 1.1  2006/01/16 23:14:06  mjk
# - more source built foundations
# - scipy stuff is here now (may move to hpc roll)
#

build::
	gunzip -c pexpect-4.8.0.tar.gz | $(TAR) -xf -
	(								\
		cd pexpect-4.8.0;					\
		$(PY.PATH) setup.py build;				\
	)
	
install::
	(								\
		cd pexpect-4.8.0;					\
		$(PY.PATH) setup.py install --root=$(ROOT);		\
	)


clean::
	rm -rf pexpect-4.8.0
