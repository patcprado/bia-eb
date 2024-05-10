ambiente=$1

if [ "$ambiente" = "hom" ]; then
    API_URL="http://bia-be.us-east-1.elasticbeanstalk.com"
elif [ "$ambiente" = "dev" ]; then
    API_URL="http://bia-be.us-east-1.elasticbeanstalk.com"
else
    echo "Ambiente de invalido."
    exit 1
fi

echo "Ambiente de $ambiente detectado."
./build.sh $API_URL
./deploy-front-assets.sh $API_URL $ambiente
eb deploy bia-$ambiente-v2 --staged