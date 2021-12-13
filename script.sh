#!/bin/bash

# automate builds and running scans for bug reporting

echo "--- build"
mvn clean install
docker build --pull --rm -f "Dockerfile" -t example:latest "."

echo "--- lacework scanner"
lw-scanner version

echo "--- lacework evaluate"
echo lw-scanner image scan example latest --scan-library-packages --verbose --debug
lw-scanner image scan example latest --scan-library-packages --verbose --debug

echo "--- lacework evaluate"
echo lw-scanner image evaluate example latest --fixable --scan-library-packages --verbose --debug
lw-scanner image evaluate example latest --fixable --scan-library-packages --verbose --debug

echo "--- trivy scanner"
trivy --version
trivy image example:latest
