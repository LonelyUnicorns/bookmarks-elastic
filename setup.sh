
# https://stackoverflow.com/a/3931779
command_exists () {
    type "$1" &> /dev/null ;
}

file_exists () {
    cat "$1" &> /dev/null ;
}

if ! command_exists docker ; then
	sudo apt-get install docker && sudo apt install docker-compose
fi

if ! file_exists .env ; then
	mv .env.example .env
fi

source .env

sudo docker-compose down
sudo docker-compose kill

sudo docker-compose up -d
