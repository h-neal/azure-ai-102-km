#!/bin/bash

# Set values for your Search service
url="[redacted]"
admin_key="[redacted]"

echo "-----"
echo "Creating the data source..."
curl -X POST "$url/datasources?api-version=2020-06-30" \
  -H "Content-Type: application/json" \
  -H "api-key: $admin_key" \
  -d @data_source.json

echo "-----"
echo "Creating the skillset..."
curl -X PUT "$url/skillsets/margies-custom-skillset?api-version=2020-06-30" \
  -H "Content-Type: application/json" \
  -H "api-key: $admin_key" \
  -d @skillset.json

echo "-----"
echo "Creating the index..."
curl -X PUT "$url/indexes/margies-custom-index?api-version=2020-06-30" \
  -H "Content-Type: application/json" \
  -H "api-key: $admin_key" \
  -d @index.json

# Wait (3 seconds in Bash)
echo "-----"
echo "Waiting for 3 seconds..."
sleep 3

echo "-----"
echo "Creating the indexer..."
curl -X PUT "$url/indexers/margies-custom-indexer?api-version=2020-06-30" \
  -H "Content-Type: application/json" \
  -H "api-key: $admin_key" \
  -d @indexer.json