
#!/bin/bash
# Simplificando comandos de git

PS3='Por favor ingresa la opción (número): '
options=("Enviar todos los cambios a repositorio personal"\
 "Enviar todos los  cambios a repositorio colaborativo" \
 "Sincronizar / Sobreescribir con repo personal (Elimina tus cambios en el editor)" \
 "Sincronizar / Sobreescribir con repositorio colaborativo (Elimina tus cambios en editor)" \
 "Salir")


select opt in "${options[@]}"
do
    echo ""
    case $opt in
        "Enviar todos los cambios a repositorio personal")
            read -p "Escribe un mensaje corto descriptivo de los cambios: " commit_msg 
            git add .
            git commit -m "- $commit_msg"
            git fetch
            git rebase
            git push
            echo ""
            echo "Datos enviados! <------------"
            break
            ;;

        "Enviar todos los  cambios a repositorio colaborativo")
            read -p "Cual es el número de 'Issue' asociado a este envío?: " commit_msg 
            git add .
            git commit -m "- $commit_msg"
            git fetch
            git rebase
            git push
            gh repo set-default https://github.com/hisandan/git-test
            gh pr create --title "- $commit_msg" --body "-"
            rm rebase
            echo ""
            echo "Datos enviados! <------------"
            break
            ;;
        "Sincronizar / Sobreescribir con repo personal (Elimina tus cambios en el editor)")
            # git add . (No estoy seguro de que esto no afecte lo de adelante...)
            # git commit -m "backup antes de actualizar forzadamente con info del repositorio personal"
            # git push --force
            git fetch origin
            git reset --hard origin/main
            echo ""
            echo "Datos Actualizados! <------------"
            break
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
            echo ""
            echo "Datos Actualizados! <------------"
            break
            ;;
        "Salir")
            break
            ;;
        *) echo "Opción invalida $REPLY";;
    esac
done