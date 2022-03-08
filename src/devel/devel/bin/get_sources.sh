#!/bin/bash
#
# Script to parse the non-text sources metadata file and download
# the required files to build a roll from our web repo
#
# Please note: this script is non-destructive, it wont replace
# files that already exist, regardless of their state, allowing you
# to have work-in-progress content that wont get overwritten.
#

MYDIR=$(dirname $0)
GGET=$MYDIR/gget.sh

if [ ! "$SURL" ]; then
	# rocksclusters download base URL
	SURL="https://rockyrocks.techshepherd.org/"
fi

pn=$(basename `pwd`)
f=.${pn}.metadata


if [ ! -e ${f} ]; then
  echo 'Unable to find ${f}.'
  echo 'You need to run this command from a directory containing a metadata file.'
  exit 1
fi

while read a; do
  fsha=$( echo ${a}  | cut -f1 -d\ )
  fname=$( echo ${a} | cut -f2 -d\ )
  fobj=$( echo ${a} | cut -f3 -d\ )
  if [ ${fsha} = "da39a3ee5e6b4b0d3255bfef95601890afd80709" ]; then
    # zero byte file
    touch ${fname}
  else
    if [ ! -e ${fname} ]; then
      url=${SURL}/${pn}/`basename ${fname}`
      echo Getting ${url}
      basepath=`dirname ${fname}`
      test -d $basepath || mkdir -p $basepath
      if [ "x${fobj}" == "x" ]; then
      	curl -L "$url" -o ${fname}
      else
        echo Using gget
        $GGET ${fobj} ${fname}
      fi
      if [ "$?" != "0" ]; then
          echo "Error download from URL $url"
          exit 1
      fi

      echo "${fsha}  ${fname}" | sha1sum -c --status;
      if [ "$?" != "0" ]; then 
          echo "Checksum error for file ${fname}"
          rm -rf ${fname}
          exit 1
      fi
    else
      echo "${fname} exists. skipping"
    fi
  fi
done < ${f}

