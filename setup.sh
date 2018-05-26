
# https://stackoverflow.com/a/3931779
command_exists () {
    type "$1" &> /dev/null ;
}

file_exists () {
    cat "$1" &> /dev/null ;
}

mkdir source && cd $_

if ! command_exists docker ; then
	sudo apt-get install docker && sudo apt install docker-compose
fi

sudo docker-compose down
sudo docker-compose kill

sudo docker-compose up -d
