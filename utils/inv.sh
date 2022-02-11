#!/bin/bash

# CREATE INVENTORY
HOSTS=${1:-500}
VARLEN=${2:-1024}

echo "[testgroup]" > test.ini
for i in $(seq $HOSTS)
do
        echo "fakehost$i ansible_host=127.0.0.1 ansible_connection=local" >> test.ini
done
echo "[testgroup:vars]" >> test.ini
echo -n "foo=" >> test.ini
printf 'A%.0s' $(seq $VARLEN) >> test.ini

awx-manage inventory_import --inventory-name="dummy_inventory" --source=test.ini
