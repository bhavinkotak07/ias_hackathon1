read -p 'Username: ' username
read -p 'IP: ' ip
read -sp 'Password: ' pass

sed -i '1s/^/pass="'$pass'" /' script.sh

sshpass -p "$pass" scp script.sh $username@$ip:script.sh
echo 'Copying script.sh'
sshpass -p "$pass" scp app.py $username@$ip:app.py
sshpass -p "$pass" scp Dockerfile $username@$ip:Dockerfile
sshpass -p "$pass" scp requirements.txt $username@$ip:requirements.txt
#sshpass -p $pass scp script.sh $username@$ip:script.sh
sshpass -p "$pass" scp retrained_graph.pb $username@$ip:retrained_graph.pb
sshpass -p "$pass" scp retrained_labels.txt $username@$ip:retrained_labels.txt
sshpass -p "$pass" ssh -o StrictHostKeyChecking=no $username@$ip 'mkdir -p templates'
sshpass -p "$pass" ssh $ip -l $username 'mkdir -p images'
sshpass -p "$pass" scp templates/index.html $username@$ip:templates/index.html
sshpass -p "$pass" ssh $ip -l $username 'chmod a+x script.sh'
echo 'Running script.sh'
sshpass -p "$pass" ssh $ip -l $username 'bash script.sh'






