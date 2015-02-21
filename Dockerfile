# Install Git
run apt-get install -y git
# Clone project
run git clone https://github.com/gravefall/helloworld.git
# Download most of maven dependencies
run cd helloworld && mvn dependency:go-offline
# Build a given tag
run cd helloworld && git fetch && git reset --hard df159436973cdf58588d56a171cab310416bb6a2
run cd helloworld && mvn verify dependency:copy-dependencies
# Expose the http port
expose 8080
workdir helloworld
cmd ["java", "-jar", "target/hello.jar"]
