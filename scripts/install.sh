#!/bin/sh

pushd ../lib/java-debug/
  ./mvnw clean install
popd

sleep 1

pushd ../lib/vscode-java-test/
  npm install
  npm run build-plugin
popd
