# $Id: __init__.py,v 1.6 2012/11/27 00:48:11 phil Exp $
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
# $Log: __init__.py,v $
# Revision 1.6  2012/11/27 00:48:11  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.5  2012/05/06 05:48:21  phil
# Copyright Storm for Mamba
#
# Revision 1.4  2011/07/23 02:30:26  phil
# Viper Copyright
#
# Revision 1.3  2010/09/07 23:52:51  bruno
# star power for gb
#
# Revision 1.2  2010/08/27 17:16:27  bruno
# change the parameter name from 'p' to 'passphrase'
#
# Revision 1.1  2010/06/29 21:46:59  bruno
# add a command to generate a RSA private/public key pair
#
#

import rocks.commands
import os

class command(rocks.commands.create.command):
	MustBeRoot = 0


class Command(command):
	"""
	Create a RSA private/public key pair. These keys can be used to
	control the power for host and to open a console to VM. The private
	key will be stored in the specified by the 'key' parameter and the
	public key will be written to standard out.

	<param type='string' name='key'>
	The filename that will be used to store the private key.
	</param>

	<param type='boolean' name='passphrase'>
	Set this to 'no' if you want a passphraseless private key. The default
	is 'yes'.
	</param>
	"""

	def run(self, params, args):
		(key, p) = self.fillParams([
			('key', ),
			('passphrase', 'yes')
			])

		passphrase = self.str2bool(p)
		
		if not key:
			self.abort('must supply a filename for the private key')
		if os.path.exists(key):
			self.abort("the key file '%s' already exists" % key)

		#
		# generate the private key
		#
		cmd = 'openssl genrsa '
		if passphrase:
			cmd += '-des3 '
		cmd += '-out %s 1024' % key
		status = os.system(cmd)
		if status == 0:
			os.chmod(key, 0o400)

			#
			# output the public key
			#
			os.system('openssl rsa -in %s -pubout' % key)
		else:
			os.remove(key)


