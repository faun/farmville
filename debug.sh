HOST=hyperion; ansible -m setup "$HOST" -i inventories/production/hosts | sed -E "s/$HOST \| SUCCESS =>//" > "$HOST.json"
