#!/bin/sh
mvn -DskipTests -Dmaven.javadoc.skip=true -Djavacpp.platform=ios-x86_64 --projects openblas,mkl install
mkdir -p targetlib/ios-x86_64
rm -f targetlib/ios-x86_64/libopenblas.a
ar cr targetlib/ios-x86_64/libopenblas.a  openblas/target/classes/org/bytedeco/javacpp/ios-x86_64/jniopenblas.o
mvn -DskipTests -Dmaven.javadoc.skip=true -Djavacpp.platform=ios-arm64 --projects openblas,mkl install
mkdir -p targetlib/ios-arm64
rm -f targetlib/ios-arm64/libopenblas.a
ar cr targetlib/ios-arm64/libopenblas.a  openblas/target/classes/org/bytedeco/javacpp/ios-arm64/jniopenblas.o
lipo -create -output libopenblas.a targetlib/ios-x86_64/libopenblas.a targetlib/ios-arm64/libopenblas.a
