#! /bin/bash

####################################################################################################
# 
# SimpleMorphoMath - A simple mathematical morphology library.
# Copyright (C) 2012 Salvaire Fabrice
#
####################################################################################################

####################################################################################################

root_dir=`python -c "import os ; print os.path.dirname(os.path.dirname(os.path.realpath('$0')))"`

api=${root_dir}/doc/sphinx/source/api
#old_api=${root_dir}/doc/sphinx/old-api

#mkdir -p ${old_api}
#mv --backup=numbered $api ${old_api}

echo
echo Generate RST API files
${root_dir}/tools/generate-rst-api

echo
echo Run Sphinx
cd doc/sphinx/
./make-html #--clean
cd -

#echo
#echo Old api directory moved to
#ls -l -h ${old_api}

####################################################################################################
#
# End
#
####################################################################################################
