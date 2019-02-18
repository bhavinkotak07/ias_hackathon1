pass="rushit@123" pass="rushit@123" pass="rushit@123" pass="rushit@123"
if [ -x "$(command -v docker)" ]; then
    echo "Update docker"
    # command
else
    echo "Install docker"
    # command
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
fi
echo $pass | sudo -S docker build -t hackathon6 .
echo $pass | sudo -S docker run -p 8000:8000 --net=host hackathon6

