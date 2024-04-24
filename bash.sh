#!/bin/bash

# Activate virtual environment
source myenv/bin/activate

# Open Kafka folder
echo "Opening Kafka Folder"
cd kafka &

# Start ZooKeeper and Kafka server
echo "Starting ZooKeeper..."
zookeeper-server-start.sh /path/to/zookeeper.properties &

echo "Starting Kafka server..."
kafka-server-start.sh /path/to/server.properties &

# Wait for Kafka server to start
echo "Waiting for Kafka server to start..."
sleep 60  # Wait for 1 minute

# Run Python scripts
echo "Running 1ProducerAss.py..."
python3 /home/awais-khaleeq/kafka/1ProducerAss.py &

echo "Running 1ConsumerAss.py..."
python3 /home/awais-khaleeq/kafka/1ConsumerAss.py &

echo "Running 2ConsumerAss.py..."
python3 /home/awais-khaleeq/kafka/2ConsumerAss.py &

# Wait for scripts to finish (optional)
wait

# Deactivate virtual environment
deactivate

