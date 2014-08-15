**Engligh** - [Español](README-es.md)

# easyparser-view

helper tool for [EasyParser](https://github.com/gusaaaaa/easyparser) by [gusaaaaa](https://github.com/gusaaaaa)

## installation

after cloning the repo you need to initialize the submodule, to do that you need to run the following commands:

    git submodule init
    git submodule update

this will update the EasyParser code

then install rvm+ruby with:

    curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.2

and the gems with:

    bundle install

ready!

## usage

run the following command:

    bundle exec ruby app.rb

to launch a dev server in your localhost, then open a browser and point it to `http://localhost:4567/` to load the application

you'll see two fields, one is for the URL of the page to be scraped and the large text box is for the EasyParser template (please refer to EasyParser's documentation for the syntax)

the app will progressively show you the scraped data below the preview area
