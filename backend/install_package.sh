#!/bin/bash
package_name=$1
if [[ -z $package_name ]]
then
    echo "specify package name"
    exit
fi

pip3 install $package_name && pip3 freeze | grep -i $package_name | awk '{print "\n\n" $0}' >> ./requirements.txt