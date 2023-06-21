#!/bin/bash

# create our topic with appropriate configs
kafka-topics.sh --bootstrap-server localhost:9092 --create --topic employee-salary --partitions 1 --replication-factor 1 --config cleanup.policy=compact --config min.cleanable.dirty.ratio=0.001 --config segment.ms=5000

# Describe Topic Configs
kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic employee-salary

# in a new tab, we start a consumer
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic employee-salary --from-beginning --property print.key=true --property key.separator=,

# we start pushing data to the topic
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic employee-salary --property parse.key=true --property key.separator=,
> Patrick,salary: 10000
> Lucy,salary: 20000
> Bob,salary: 20000
> Patrick,salary: 25000
> Lucy,salary: 30000
> Patrick,salary: 30000

# Wait a minute, and produce a few more messages (it could be the same messages)
> Stephane,salary: 0

# Stop the Kafka console consumer and start a new one. We are fetching all the messages from the beginning. We should see only the unique keys with their corresponding latest values.
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic employee-salary --from-beginning --property print.key=true --property key.separator=,