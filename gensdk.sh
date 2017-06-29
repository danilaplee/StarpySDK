#!/bin/bash
#
# Generates Proxy and Swift sources for swifthello Android sample
# Note use of -parameters option when compiling to record names
#

cd `dirname $0`/src &&

$JAVA_HOME/bin/javac -parameters me/starpy/sdk/*.java &&

$JAVA_HOME/bin/jar cf /tmp/sdk.jar me/starpy/sdk/*.class &&

cd - &&

# The last argument is the frameworks the project
# is dependent on. java_lang for example will add
# about 2mb to the app's apk and needs to be added
# to the project's src/main/swift/Package.swift

./genswift.sh me.starpy.sdk /tmp/sdk.jar "" &&

mkdir -p src/main/java/{me/starpy/sdk,org/genie/me_starpy_sdk} &&

\cp -v ./src/me/starpy/sdk*.java src/main/java/me/starpy/sdk &&
\cp -v ./src/org/genie/me_starpy_sdk/*.java src/main/java/org/genie/me_starpy_sdk &&

\cp -v ./me_starpy_sdk/Sources/*.swift ./sdk-android/src/main/swift/Sources
