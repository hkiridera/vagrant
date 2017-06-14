#     ########## https://github.com/BU-NU-CLOUD-SP16/MOC-Monitoring/wiki


#     ##########
#     git clone https://github.com/openstack/monasca-vagrant.git
#     cd monasca-vagrant
#     cp /vagrant/ansible-hosts hosts
#     sudo chmod 666 hosts
#     ansible-galaxy install -r requirements.yml -p ./roles
#     cd ..
#     #########
#     sudo apt-get install -y scala
#     sudo cp /vagrant/data/kafka_2.9.2-0.8.1.1.tgz ./
#     tar xvf kafka_2.9.2-0.8.1.1.tgz
#     mv kafka_2.9.2-0.8.1.1 kafka
#     rm kafka_2.9.2-0.8.1.1.tgz
#     sudo apt-get install -y zookeeper zookeeperd zookeeper-bin
#     cp /vagrant/data/server.properties kafka/config/server.properties
#     cd kafka/
#     nohup bin/zookeeper-server-start.sh config/zookeeper.properties &
#     nohup bin/kafka-server-start.sh config/server.properties &
#     ./bin/kafka-topics.sh --create --topic metrics --partitions 4 --zookeeper 192.168.10.4:2181 --replication-factor 1
#     ./bin/kafka-topics.sh --create --topic events --partitions 4 --zookeeper 192.168.10.4:2181 --replication-factor 1
#     ./bin/kafka-topics.sh --create --topic raw-events --partitions 4 --zookeeper 192.168.10.4:2181 --replication-factor 1
#     ./bin/kafka-topics.sh --create --topic transformed-events --partitions 4 --zookeeper 192.168.10.4:2181 --replication-factor 1
#     ./bin/kafka-topics.sh --create --topic alarm-state-transitions --partitions 4 --zookeeper 192.168.10.4:2181 --replication-factor 1
#     ./bin/kafka-topics.sh --create --topic alarm-notifications --partitions 4 --zookeeper 192.168.10.4:2181 --replication-factor 1
#     ./bin/kafka-topics.sh --create --topic retry-notifications --partitions 4 --zookeeper 192.168.10.4:2181 --replication-factor 1
#     cd ..
#     ##########
#     curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
#     source /etc/lsb-release
#     echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
#     sudo apt-get update && sudo apt-get install influxdb
#     sudo service influxdb start
#     cd ..
#     ##########
#     ##########
#     git clone https://github.com/openstack/monasca-common.git
#     cd monasca-common/
#     git checkout -b stable/mitaka remotes/origin/stable/mitaka
#     sudo pip install -r requirements.txt
#     sudo python setup.py install
#     cd java
#     sudo mvn clean install
#     cd ../../
#     ##########
#     git clone https://github.com/openstack/monasca-persister.git
#     cd monasca-persister/
#     git checkout -b stable/mitaka remotes/origin/stable/mitaka
#     sudo pip install -r requirements.txt
#     sudo python setup.py install
#     cd monasca_persister
#     sudo mkdir -p /var/log/monasca/persister/
#     sudo pip install kafka-python==0.9.5
#     sudo nohup python persister.py --config-file persister.conf &
#     cd ../../
#     ##########
#     git clone https://github.com/openstack/monasca-api.git
#     cd monasca-api/
#     git checkout -b stable/mitaka remotes/origin/stable/mitaka
#     sudo cp /vagrant/data/mon-api_requirements.txt requirements.txt
#     sudo pip install -r requirements.txt
#     sudo python setup.py install
#     sudo mkdir /etc/monasca
#     sudo cp /vagrant/data/api-config.ini /etc/monasca/api-config.ini
#     sudo cp /vagrant/data/api-config.conf /etc/monasca/api-config.conf
#     gunicorn -k eventlet --worker-connections=2000 --backlog=1000 --paste /etc/monasca/api-config.ini -D
#     cd ..
#     ##########
#     git clone https://github.com/openstack/monasca-notification.git
#     cd monasca-notification/
#     git checkout -b stable/mitaka remotes/origin/stable/mitaka
#     sudo pip install -r requirements.txt
#     sudo python setup.py install
#     sudo cp notification.yaml /etc/monasca/
#     cd ..
#     ##########
#     #git clone https://github.com/openstack/monasca-thresh.git
#     #cd monasca-thresh/
#     #cd thresh
#     #mvn package
#     
#     ##########
#     sudo cp /vagrant/data/grafana_2.6.0_amd64.deb ./
#     sudo apt-get install -y adduser libfontconfig 
#     sudo dpkg -i grafana_2.6.0_amd64.deb 
#     sudo service grafana-server start 
#     sudo update-rc.d grafana-server defaults 95 10 
#     ## username:admin
#     ## password:admin
#     ## https://github.com/BU-NU-CLOUD-SP16/MOC-Monitoring/wiki/How-to-Install-Grafana
#     
#     
#     ##########
#     #sudo apt-get install -y mysql-server libmysqlclient-dev
#     ## password:password
#     #wget https://raw.githubusercontent.com/stackforge/cookbook-monasca-schema/master/files/default/mysql/mon.sql
#     #mysql -uroot -ppassword < mon.sql
#     #rm -rf mon.sql
#     #sudo sed -i.bak 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
#     #sudo service mysql restart