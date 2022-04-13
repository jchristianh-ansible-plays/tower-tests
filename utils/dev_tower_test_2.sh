#!/bin/bash

CONC="50"
REQU="50"

BASE_URL="10.1.1.98"
AAP_JOB_ID="12"
POST_PAYLOAD_PATH="empty.post"
#POST_PAYLOAD_PATH="provision.post"
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
  -p ${POST_PAYLOAD_PATH} "https://${BASE_URL}/api/v2/job_templates/${AAP_JOB_ID}/launch/" | \
  grep "Failed requests\|Time taken for tests"
