API_ENDPOINT=$1
AMBIENTE=$2
REACT_APP_API_URL=$API_ENDPOINT SKIP_PREFLIGHT_CHECK=true npm run build --prefix client

#sincronizando pasta local com o S3 bucket, objetivo fazer deploy do asset
#deploy serah feito separado assets primeiro e depois o index.html(arquivo de controle).
echo '>> FAZENDO DEPLOY DOS ASSETS'
aws s3 sync client/build s3://bia-asset-eb/$AMBIENTE --exclude "index.html" --profile bia
echo '> Finalizado...'

echo '>> FAZENDO DEPLOY DO INDEX.HTML'
aws s3 sync client/build s3://bia-asset-eb/$AMBIENTE --exclude "*" --include "index.html" --profile bia
echo '> Finalizado...'
echo '> Deploy finalizado...'