docker stop aiquokka
docker rm aiquokka
docker build -t aiquokka .
docker run --name aiquokka -d -p 8080:80 aiquokka
explorer http://localhost:8080