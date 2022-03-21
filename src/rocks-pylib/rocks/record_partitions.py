#!/opt/rocks/bin/python

import builtins
import sys
sys.path.append('/tmp/product')
from . import rocks_partition
import http.client
import random
import time
import string
import socket
sys.path.append('/tmp')

remotehost=socket.gethostname().split('.')[0]
try:
	import db_partition_info
	remotehost=db_partition_info.KickstartHost
except:
	pass

def sendit(server, req, nodepartinfo):
	status = 0

	h = http.client.HTTPSConnection(server, key_file = None, cert_file = None)
	h.putrequest('GET', '/install/sbin/public/setDbPartitions.cgi')

	h.putheader('X-Rocks-PartitionInfo', repr(nodepartinfo))

	try:
		h.endheaders()
		response = h.getresponse()
		status = response.status
	except:
		#
		# assume the error occurred due to an
		# authorization problem
		#
		status = 403
		pass

	h.close()
	return status

#
# main
#
p = rocks_partition.RocksPartition()

#
# get the list of hard disks and software raid devices
#
disks = p.getDisks() + p.getRaids()
nodepartinfo = p.getNodePartInfo(disks)

#
# only try to report the partitions back to the frontend, if this isn't
# a frontend
#
file = open('/proc/cmdline', 'r')
args = file.readline().split()
file.close()

if 'build' not in args:
	random.seed(int(time.time()))

	for i in range(0, 5):
		status = sendit(remotehost,
			'/install/sbin/public/setDbPartitions.cgi',
			nodepartinfo)
	
		if status == 200:
			break
		else:
			time.sleep(random.randint(0, 10))
		
#
# mark each disk as a 'rocks' disk -- this let's us know that we have
# 'seen' and configured this disk
#
for disk in builtins.list(nodepartinfo.keys()):
	p.isRocksDisk(nodepartinfo[disk], touchit = 1)

