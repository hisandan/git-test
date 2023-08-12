
#!/bin/bash
# Bash Menu Script Example

PS3='Por favor ingresa la opción (número): '
options=("Enviar todos los cambios a repositorio personal"\
 "Enviar todos los  cambios a repositorio colaborativo" \
 "Sincronizar / Sobreescribir con repo personal (Elimina tus cambios en el editor)" \
 "Sincronizar / Sobreescribir con repositorio colaborativo (Elimina tus cambios en editor)" \
 "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Enviar todos los cambios a repositorio personal")
            read -p "Escribe un mensaje corto descriptivo de los cambios: " commit_msg 
            git add .
            git commit -m $commit_msg
            git rebase
            add -> commit -> fetch -> rebase -> push 

            echo "Datos enviados!"
            ;;
        "Enviar todos los  cambios a repositorio colaborativo")
            echo "you chose choice 2"
            ;;
        "Sincronizar / Sobreescribir con repo personal (Elimina tus cambios en el editor)")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Sincronizar / Sobreescribir con repositorio colaborativo (Elimina tus cambios en editor)")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Salir")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done