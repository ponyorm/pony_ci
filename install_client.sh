cd /oracle_stuff
wget -O oracle-client-basic.rpm https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-basic-19.6.0.0.0-1.x86_64.rpm
wget -O oracle-client-sqlplus.rpm https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-sqlplus-19.6.0.0.0-1.x86_64.rpm
apt install -y alien && alien -i oracle-client-basic.rpm && alien -i oracle-client-sqlplus.rpm 
echo 'ORACLE_HOME=/usr/lib/oracle/11.2/client64' >> ~/.bashrc
echo 'PATH=$ORACLE_HOME/bin:$PATH' >> ~/.bashrc
echo 'LD_LIBRARY_PATH=$ORACLE_HOME/lib' >> ~/.bashrc
echo 'export ORACLE_HOME' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export PATH' >> ~/.bashrc
source ~/.bashrc
