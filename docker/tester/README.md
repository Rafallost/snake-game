# A container for running application tests in an isolated environment.
# It is based on the rafal206/dependencies:1.0 image, so it has:
* Go and all the tools for building test
* Access to the application code via the volume

# Local build
`docker build -t rafal206/snake-tester:1.0 .`

# Tests execution
`docker run --rm -v $(pwd)/../..:/workspace rafal206/snake-tester:1.0`