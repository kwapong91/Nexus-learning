#!/bin/bash

echo ""
echo "Docker Installation for Mac M1/M2 chip + Nexus Installation"
echo "---------------------------------------------"


# Run Nexus container with UI on 8081 and Docker Registry on 5006
echo "Starting Nexus container..."
docker run -d \
  -p 8081:8081 \
  -p 5000:5000 \
  --name nexus \
  sonatype/nexus3


# Wait for Nexus to fully startup
echo "Waiting for Nexus to start..."
sleep 60


# Show admin password
echo "Nexus Admin Password:"
docker exec -it nexus cat /nexus-data/admin.password


# Summary
echo ""
echo "Nexus UI link -> http://localhost:8081"
echo ""
echo "Test pushing artifact:"
echo "1. Open Nexus UI and create a Docker (hosted) repo with a connector port 5000(http)."
echo "2. Tag your image: docker tag <your-image> localhost:5000/<your-image>"
echo "3. You'll need to login in the terminal to push/pull: docker login localhost:5000"
echo "4. Push command: docker push localhost:5000/<your-image>"
