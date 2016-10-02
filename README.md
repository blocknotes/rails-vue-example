# Rails vue example

A simple starter project to use Vue.js with Ruby on Rails

## Rails setup

- Create a basic web app:
```sh
rails _4.2.5.2_ new rails-vue-example -j --skip-spring --skip-turbolinks
```

- Create a controller (ex. *home*), a view (ex. *home/index*) and setup a default route (ex. *home#index*)

- Setup *bower-rails*:
```sh
rails g bower_rails:initialize
echo -e "\nasset 'vue'" >>! Bowerfile
rake bower:update
```

- Add *vue.js* reference to *application.js* (or .coffee): `//= require vue/dist/vue`
