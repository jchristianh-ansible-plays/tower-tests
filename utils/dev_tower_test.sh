#!/bin/bash

CONC="100"
REQU="100"

BASE_URL="10.1.1.98"
AAP_JOB_ID="22"
LAUNCH_URL="workflow_job_templates/${AAP_JOB_ID}/launch/"
#POST_PAYLOAD_PATH="empty.post"
POST_PAYLOAD_PATH="message.post"
POST_PAYLOAD_TYPE="application/json"

TOWER_USER="admin"
TOWER_PASS="redhat"


printf "\n%s\n" \
  "# Running test - ${REQU} requests / ${CONC} concurrency"
  ab -c "${CONC}" \
  -n ${REQU} \
  -A ${TOWER_USER}:${TOWER_PASS} \
  -T "${POST_PAYLOAD_TYPE}" \
  -v1 \
  -p ${POST_PAYLOAD_PATH} "https://${BASE_URL}/api/v2/${LAUNCH_URL}" | \
  grep "Failed requests\|Time taken for tests"
