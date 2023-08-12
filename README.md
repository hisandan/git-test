readme from hisandan



Checkear que esté en repo fork si no que avise a la persona que debe seguir los pasos para hacer el fork del repo...

Sincronizar / Sobreescribir con repositorio colaborativo (Elimina tus cambios en editor):
(add info until now as backup?):
git add .
git commit -m "backup antes de actualizar forzadamente con info del repositorio colaborativo"
git push --force
git fetch upstream
git reset --hard upstream/main
git add .
git commit -m "Estado actual Repositorio Colaborativo"
git push --force
 

 ---------------------------------

Enviar todos los  cambios a repositorio colaborativo:
add -> commit -> fetch -> rebase -> push -> pull request (No importa conficts)
(Pedir asignar numero del Issue)

Enviar todoes los cambios a repositorio personal:
add -> commit -> fetch -> rebase -> push 

Sincronizar / Sobreescribir con repositorio colaborativo (Elimina tus cambios en editor):
(add info until now as backup?)

Sincronizar / Sobreescribir con repo personal (Elimina tus cambios en el editor)




