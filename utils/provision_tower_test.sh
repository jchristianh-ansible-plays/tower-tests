#!/bin/bash

CONC="150"
REQU="150"
SLEEP_SECS="400"

BASE_URL="tower2.thezengarden.net"
AAP_JOB_ID="26"
POST_PAYLOAD_PATH="provision.post"
POST_PAYLOAD_TYPE="application/json"

TOWER_USER="admin"
TOWER_PASS="redhat"


printf "\n%s\n" \
  "# Running test ${ITER}"
  ab -c "${CONC}" \
  -n ${REQU} \
  -A ${TOWER_USER}:${TOWER_PASS} \
  -T "${POST_PAYLOAD_TYPE}" \
  -v1 \
  -p ${POST_PAYLOAD_PATH} "https://${BASE_URL}/api/v2/job_templates/${AAP_JOB_ID}/launch/" | \
  grep "Failed requests\|Time taken for tests"
