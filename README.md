# Rails Vue example

A simple starter project to use Vue.js with Ruby on Rails using the asset pipeline

A Vue component to show hours and minutes:

![Rails Vue example](https://raw.githubusercontent.com/blocknotes/rails-vue-example/master/screenshot.png "Rails Vue example")

To run this example just *git clone*, *bundle* and start the server.

This uses a *gem* to pull in vue. Since rails 5.1 the setup can be achieved
using webpacker too, but this example shows how to avoid that complexity.

## Rails & Vue setup

How to create a basic app (like this) , just

- Create a basic web app:
```sh
rails new rails-vue-example -j --skip-spring --skip-turbolinks
```

- Create a controller (ex. *home*), a view (ex. *home/index*) and setup a default route (ex. *home#index*)

- Add *vuejs-rails* to *Gemfile*
```ruby
  gem "vuejs-rails"
```

- Add *vue.js* reference to *application.js* (or .coffee):
```ruby
//= require vue
```

At this point you can start using the Vue instance in javascript files and
vue syntax in your templates.

## Vue components setup

It is also possible to use Vue components with above setup, but they will have to
be located in the asset tree.

To load components from an "app/views/components" directory, you can follow the
steps below

- app/assets/javascripts/application.js: add
```ruby
//= require components_init
```

- app/assets/stylesheets/application.css: add
```ruby
*= require components_init
```

- app/views/layouts/application.html.slim: move in the end of body tag:
```ruby
= javascript_include_tag 'application'
```

- config/assets/initializers: add:
```ruby
Rails.application.config.assets.paths << Rails.root.join( 'app', 'views', 'components' )
```

- app/views/components/components_init.css: content:
```css
/*
 *= require_tree .
 */
```

- app/views/components/components_init.js: content:
```javascript
//= require_tree .
```

## Usage

- app/assets/javascripts/init.js: init the vue app:
```javascript
new Vue({
  el: '#app'
});
```

- app/views/home/someview.html.slim: add an `#app` block with a custom tag inside
```slim
#app
  a-clock init-hour="12" init-min="25"
```

- app/views/components/clock/: create a new component with *clock.sass*, *clock.js.erb*, *clock.html.slim*

## Notes

- Slim templates are rendered when the asset pipeline is precompiled, so we need to avoid to call server side function to fetch data; instead we can use AJAX to load data remotely for example using [vue-resource](https://github.com/vuejs/vue-resource).
