mvn -DskipTests -Dmaven.javadoc.skip=true -Djavacpp.platform=ios-x86_64 --projects openblas,mkl install
ar cr libopenblas.a  openblas/target/classes/org/bytedeco/javacpp/ios-x86_64/jniopenblas.o
