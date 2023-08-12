
#!/bin/bash
# Simplificando comandos de git

PS3='Por favor ingresa la opción (número): '
options=("Enviar todos los cambios a repositorio personal"\
 "Enviar todos los  cambios a repositorio colaborativo" \
 "Sincronizar / Sobreescribir con repo personal (ELIMINA TUS CAMBIOS EN EL EDITOR!!)" \
 "Sincronizar / Sobreescribir con repositorio colaborativo (ELIMINA TUS CAMBIOS EN EL REPOSITORIO PERSONAL!!)" \
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
            read -p "Cual es el número de 'Issue' asociado a este envío?: " issue 
            git add .
            git commit -m "Issue: $issue"
            git fetch
            git rebase
            git push
            gh repo set-default https://github.com/hisandan/git-test
            gh pr create --title "Issue: $issue" --body "-"
            echo ""
            echo "Datos enviados! <------------"
            break
            ;;
        "Sincronizar / Sobreescribir con repo personal (ELIMINA TUS CAMBIOS EN EL EDITOR!!)")
            # git add . (No estoy seguro de que esto no afecte lo de adelante...)
            # git commit -m "backup antes de actualizar forzadamente con info del repositorio personal"
            # git push --force
            git fetch origin
            git reset --hard origin/main
            echo ""
            echo "Datos Actualizados! <------------"
            break
            ;;
        "Sincronizar / Sobreescribir con repositorio colaborativo (ELIMINA TUS CAMBIOS EN EL REPOSITORIO PERSONAL!!)")
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

# lo siguiente se realiza debido a que se estaban creado archivos vacios al ejecutar las opciones anteriores
rm rebase > /dev/null 2>&1
rm commit > /dev/null 2>&1
rm fetch > /dev/null 2>&1
rm pull > /dev/null 2>&1
rm push > /dev/null 2>&1
