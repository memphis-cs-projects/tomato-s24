# Team xxxx

## Team Members

- xxxx

## How to Initialize and Run the App

### Prerequisites

- RVM is assumed.
- Ruby version 3.1.2 is required.
  - `rvm install 3.1.2` - Install Ruby 3.1.2 using RVM.
- PostgreSQL is required.

### Initializing the App

- `bundle install` - Install all the necessary gems.
- `rails db:migrate:reset` - Reset and initialize the database.
- `rails db:seed` - Save seed data to the database (see `db/seeds.rb`).
  - No seed data is included in the base app.

### Running the App

- `rails s` - Run the development web server.
- Open <http://localhost:3000/> in the browser to launch the app (root page).

## Included with the Base App

- Devise
  - A Devise `User` class has been generated (see `app/model/user.rb`).
  - The Devise view templates have been added (see `app/views/devise/`).
- Bootstrap v5.2.3
- BootSwatch v5.2.3
  - A list of BootSwatch themes can be found here.
  - The `darkly` theme is set by default (see `app/assets/stylesheets/application.scss`).
- Flash Notifications
  - Implemented as per the Rails Demos-n-Deets.
- Home Page
  - A `HomeController` with a `show` action and view template is included.
  - The root route is set to this `show` action (see `config/routes.rb`).
