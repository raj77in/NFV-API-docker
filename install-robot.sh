#!/bin/bash - 
#===============================================================================
#
#          FILE: install-robot.sh
# 
#         USAGE: ./install-robot.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Amit Agarwal (aka), amit.agarwal@mobileum.com
#  ORGANIZATION: Individual
#       CREATED: 06/05/2019 23:42
# Last modified: Wed Jun 05, 2019  11:47PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
cd /opt
git clone https://github.com/robotframework-thailand/robotframework-jsonlibrary.git
cd robotframework-jsonlibrary/
sed -i '1,3 d' JSONLibrary/__init__.py
(cat <<EOF;
from  JSONLibrary.JSONLibraryKeywords import JSONLibraryKeywords
from JSONLibrary.version import VERSION
EOF
cat JSONLibrary/__init__.py ) > JSONLibrary/__init__2.py
mv JSONLibrary/__init__2.py JSONLibrary/__init__.py
sed -i '/from .version/ s/.version/JSONLibrary.version/' JSONLibrary/JSONLibraryKeywords.py
pip3 install .
cd /opt/api-tests
sed -i 's/robotframework-jsonlibrary==0.2/robotframework-jsonlibrary/' requirements.txt
pip3 install -r requirements.txt
