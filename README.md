Start salt master with command 
> docker-compose up

Install salt-minion on host machine.
Edit /etc/salt/minion and change master to 127.0.0.1
Start minion:
> sudo salt-minion -l debug

Log into master:
> docker exec -it salt /bin/sh
Accept key:
> salt-key
> salt-key -a <minion-name>

Distribute pillar state:
> salt '*' saltutil.refresh_pillar

In master container, apply the edgeapp_started state:
> salt '*' state.sls edgeapp_started 

