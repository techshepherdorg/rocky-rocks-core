#! @PYTHON@
#
# $Id: rocks-user-sync.py,v 1.13 2012/11/27 00:48:08 phil Exp $
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
# $Log: rocks-user-sync.py,v $
# Revision 1.13  2012/11/27 00:48:08  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.12  2012/05/06 05:48:17  phil
# Copyright Storm for Mamba
#
# Revision 1.11  2011/07/23 02:30:23  phil
# Viper Copyright
#
# Revision 1.10  2010/09/07 23:52:48  bruno
# star power for gb
#
# Revision 1.9  2009/05/01 19:06:50  mjk
# chimi con queso
#
# Revision 1.8  2008/10/18 00:55:47  mjk
# copyright 5.1
#
# Revision 1.7  2008/04/02 16:59:37  bruno
# nuke dead commands
#
# put message in other commands that point the user to the appropriate rocks
# command-line command.
#
# Revision 1.6  2008/03/06 23:41:32  mjk
# copyright storm on
#
# Revision 1.5  2007/06/23 04:03:19  mjk
# mars hill copyright
#
# Revision 1.4  2006/09/11 22:47:02  mjk
# monkey face copyright
#
# Revision 1.3  2006/08/10 00:09:25  mjk
# 4.2 copyright
#
# Revision 1.2  2006/07/08 16:37:08  bruno
# tell autofs to reload on all the nodes after pushing the user files
# out with 411
#
# Revision 1.1  2006/06/27 20:50:11  bruno
# replaced create-account and delete-account with a new method of maintaining
# user home directories. we now use the standard useradd and then call
# rocks-user-sync to push the user data to the nodes
#
#

print('rocks-user-sync is no longer supported. please use:')
print('\n\trocks sync users\n')
