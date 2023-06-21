# Replace "kafka-topics.sh" 
# by "kafka-topics" or "kafka-topics.bat" based on your system # (or bin/kafka-topics.sh or bin\windows\kafka-topics.bat if you didn't setup PATH / Environment variables)

# list topics
kafka-topics.sh --bootstrap-server localhost:9092 --list

# create a topic that we'll configure
kafka-topics.sh --bootstrap-server localhost:9092 --create --topic configured-topic --partitions 3 --replication-factor 1

# look for existing configurations
kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic configured-topic

# documentation of kafka-configs.sh command
kafka-configs.sh 

# Describe configs for the topic with the command
kafka-configs.sh --bootstrap-server localhost:9092 --entity-type topics --entity-name configured-topic --describe

# add a config to our topic
kafka-configs.sh --bootstrap-server localhost:9092 --entity-type topics --entity-name configured-topic --add-config min.insync.replicas=2 --alter

# Describe configs using kafka-configs
kafka-configs.sh --bootstrap-server localhost:9092 --entity-type topics --entity-name configured-topic --describe

# Describe configs using kafka-topics
kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic configured-topic

# Delete a config
kafka-configs.sh --bootstrap-server localhost:9092 --entity-type topics --entity-name configured-topic --delete-config min.insync.replicas --alter

# ensure the config has been deleted
kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic configured-topic