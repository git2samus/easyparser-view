[Engligh](README.md) - **Español**

# easyparser-view

herramienta de ayuda para [EasyParser](https://github.com/gusaaaaa/easyparser) de [gusaaaaa](https://github.com/gusaaaaa)

## instalacion

despues de clonar el repositorio es necesario inicializar el submodulo, para ello debe ejecutar los siguientes comandos:

    git submodule init
    git submodule update

con esto habra actualizado el codigo de EasyParser

a continuacion instale rvm+ruby con:

    curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.2

y las gemas con:

    bundle install

listo!

## uso

run tejecute el siguiente comando:

    bundle exec ruby app.rb

para iniciar un servidor de desarrollo en su maquina local, luego abra un navegador y dirijalo a `http://localhost:4567/` para cargar la aplicacion

vera dos campos, uno es para la URL de la pagina que sera escrapeada y la caja de texto mas grande es para el template de EasyParser (por favor dirijase a la documentacion de EasyParser para ver la sintaxis)

la aplicacion le mostrara progresivamente los datos escrapeados debajo del area de previsualizacion
