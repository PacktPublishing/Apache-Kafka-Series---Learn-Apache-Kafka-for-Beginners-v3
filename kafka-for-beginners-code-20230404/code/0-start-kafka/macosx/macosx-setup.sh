#################################
#### DOWNLOAD KAFKA BINARIES ####
#################################

# Install Java JDK 11 (Amazon Corretto 11)
# https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/downloads-list.html
# Link: https://corretto.aws/downloads/latest/amazon-corretto-11-x64-macos-jdk.pkg


# Check the Java version
java -version 
# Should say something like openjdk version "11.0.10" 2021-01-19 LTS


# Download Kafka at https://kafka.apache.org/downloads
wget https://archive.apache.org/dist/kafka/3.1.0/kafka_2.13-3.1.0.tgz

# Extract Kafka
tar -xvf kafka_2.13-3.1.0.tgz

# Move the folder
mv kafka_2.13-3.1.0 ~

# Open the Kafka directory
cd kafka_2.13-3.1.0

# Try out a Kafka command
bin/kafka-topics.sh

# Edit .bash_profile
nano ~/.bash_profile
# Add PATH="$PATH:/your/path/to/your/kafka/bin"
# Example: PATH="$PATH:~/kafka_2.13-3.1.0/bin"

# Open a new terminal
# Try running the command from any directory:
kafka-topics.sh