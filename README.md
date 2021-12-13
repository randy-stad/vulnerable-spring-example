# vulnerable-spring-example

An example container using Spring to demonstrate and test vulnerability scanners. Initial version generated using the Spring Initializr and modified to use Spring Boot 2.0.5. This version has many vulnerabilities and should **not** be used as an example for modern application development.

## build

```mvn clean install``` will compile the application.

```docker build --pull --rm -f "Dockerfile" -t example:latest "."``` will build the container with Docker.

### scan with Lacework

This step requires the Lacework vulnerability scanner installed locally and configured with proper credentials for an Inline Registry. See https://github.com/lacework/lacework-vulnerability-scanner/ for more information.

```lw-scanner image evaluate example latest --scan-library-packages```

### scan with Trivy

First, install Trivy, see https://aquasecurity.github.io/trivy/.

```trivy image example:latest```