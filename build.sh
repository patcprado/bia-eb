source utils.sh

versao=$(git rev-parse HEAD | cut -c 1-7)
aws ecr get-login-password --region us-east-1 --profile default | docker login --username AWS --password-stdin 654654321982.dkr.ecr.us-east-1.amazonaws.com
checar_ultimo_comando
docker compose -f docker-compose-build-eb.yml build bia
checar_ultimo_comando
docker tag bia:latest 654654321982.dkr.ecr.us-east-1.amazonaws.com/bia:$versao
docker push 654654321982.dkr.ecr.us-east-1.amazonaws.com/bia:$versao
checar_ultimo_comando
rm .env 2> /dev/null
./gerar-compose.sh
checar_ultimo_comando
rm bia-versao.zip
zip -r bia-versao.zip docker-compose.yml
git checkout docker-compose.yml
rm .env 2> /dev/null
