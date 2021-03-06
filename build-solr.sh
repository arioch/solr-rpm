#!/bin/sh
version="3.5.0"
rm -rf BUILD RPMS SRPMS tmp || true
mkdir -p BUILD RPMS SRPMS

if [ ! -f SOURCES/apache-solr-$version.tgz ];
then
    wget "http://apache.cu.be/lucene/solr/$version/apache-solr-$version.tgz" -O SOURCES/apache-solr-$version.tgz
fi

rpmbuild -ba --define="_topdir $PWD" --define="_tmppath $PWD/tmp" --define="ver $version" solr.spec
