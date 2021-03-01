# Movies API

Movies API is an application that serves a fictional front end to return:
- View all available movies
- View a single movie's details
- View movies by searching by year
- View movies by searching by genre

## Learning goals:
- Design, build, and test an application that responds via JSON
- Implement a basic CRUD design structure
- Implement a working application with limited time
- Implement a working application using SQLite and multiple databases

## Readme Content
- [Getting Started](#getting-started)
- [Running the Tests](#tests)
- [Database Schema](#schema)
- [Author](#author)
- 
## Getting Started
```
git clone git@github.com:dhalverson/movies_api.git
cd movies_api
```

### Prereqisites
- Ruby 2.5.3
- Rails 6.1.2.1

### Setup/Installation
```
bundle install
rails db:{drop,create,migrate,seed}
```

### Local Server
- Navigate to the directory movies_api is located
```
rails s
```
- App will be available locally at http://localhost:3000/
- Current working endpoints are:
- 
- Movie Index api/v1/movies
[![Screen-Shot-2021-02-28-at-7-46-05-PM.png](https://i.postimg.cc/J0CJxmRs/Screen-Shot-2021-02-28-at-7-46-05-PM.png)](https://postimg.cc/dknLQbkF)

- Movie Show api/v1/movies/2
[![Screen-Shot-2021-02-28-at-7-46-19-PM.png](https://i.postimg.cc/FsZcy28K/Screen-Shot-2021-02-28-at-7-46-19-PM.png)](https://postimg.cc/Xprp3DVM)

## Tests
- Tests are setup using RSpec
- Run tests using:
```
bundle exec rspec
```

## Schema
[![Screen-Shot-2021-02-28-at-7-43-37-PM.png](https://i.postimg.cc/284GPcJp/Screen-Shot-2021-02-28-at-7-43-37-PM.png)](https://postimg.cc/Wh10ZnTS)


## Author
- Daniel Halverson | [github](https://github.com/dhalverson) | [linkedin](https://www.linkedin.com/in/daniel-halverson/)
