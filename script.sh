#!/bin/bash

# automate builds and running scans for bug reporting

echo "--- build"
mvn clean install
docker build --pull --rm -f "Dockerfile" -t example:latest "."

echo "--- lacework scanner"
lw-scanner version
lw-scanner image evaluate example latest --scan-library-packages --verbose --fixable

echo "--- trivy scanner"
trivy --version
trivy image example:latest
