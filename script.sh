
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
            git commit -m "- $commit_msg"
            git fetch
            git rebase
            git push
            echo "Datos enviados!"
            ;;

        "Enviar todos los  cambios a repositorio colaborativo")
        add -> commit -> fetch -> rebase -> push -> pull request
            read -p "Cual es el número de 'Issue' asociado a este envío?: " commit_msg 
            git add .
            git commit -m "- $commit_msg"
            git fetch
            git rebase
            git push
            git pull request????
            echo "Datos enviados!"
            ;;
        "Sincronizar / Sobreescribir con repo personal (Elimina tus cambios en el editor)")
            # git add .
            # git commit -m "backup antes de actualizar forzadamente con info del repositorio personal"
            # git push --force
            git fetch upstream
            git reset --hard upstream/main
            git add .
            git commit -m "Estado actual Repositorio Colaborativo"
            git push --force
            echo "Datos Actualizados!"
            ;;
        "Sincronizar / Sobreescribir con repositorio colaborativo (Elimina tus cambios en editor)")
            git add .
            git commit -m "backup antes de actualizar forzadamente con info del repositorio colaborativo"
            git push --force
            git fetch upstream
            git reset --hard upstream/main
            git add .
            git commit -m "Estado actual Repositorio Colaborativo"
            git push --force
            echo "Datos Actualizados!"
            ;;
        "Salir")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done