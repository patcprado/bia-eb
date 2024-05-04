erro(){
    echo "########################################"
    echo "ERRO! ==> $1";
    echo "########################################"
    exit 1;
}

checar_ultimo_comando(){
    if  [ $? != 0 ]; then
        erro "Erro no deploy..."
        exit 1; 
    fi
}