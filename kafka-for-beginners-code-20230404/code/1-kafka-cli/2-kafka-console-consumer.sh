# Replace "kafka-console-consumer.sh" 
# by "kafka-console-consumer" or "kafka-console-consumer.bat" based on your system # (or bin/kafka-console-consumer.sh or bin\windows\kafka-console-consumer.bat if you didn't setup PATH / Environment variables)

kafka-console-consumer.sh 

############################
### CONDUKTOR PLATFORM #####
############################ 

# create a topic with 3 partitions
kafka-topics.sh --command-config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 --topic second_topic --create --partitions 3

# consuming
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 --topic second_topic

# other terminal
kafka-console-producer.sh --producer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic second_topic

# consuming from beginning
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 --topic second_topic --from-beginning

# display key, values and timestamp in consumer
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 --topic second_topic --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning



############################
#####     LOCALHOST    #####
############################

# create a topic with 3 partitions
kafka-topics.sh --bootstrap-server localhost:9092 --topic second_topic --create --partitions 3

# consuming
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic

# other terminal
kafka-console-producer.sh --bootstrap-server localhost:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic second_topic

# consuming from beginning
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic --from-beginning

# display key, values and timestamp in consumer
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning