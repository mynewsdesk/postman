Postman
=======
Search and filter Sendgrid email events with Postman.
See bounce/open/click and other events to easily debug and get insight.

## Prerequisites
The app uses [Keen.io](http://keen.io) as a data backend. So your Sendgrid account needs to send the events to Keen.io. [More info](https://keen.io/docs/partners/#sendgrid)

## Screenshots
![Stats](/screenshots/1.png?raw=true "Stats")
![Events](/screenshots/2.png?raw=true "Events")

## Setup/Deployment
### Local
1. Copy the example dotenv file `cp .env.example .env`
2. Customize with your own credentials
3. Run `rackup` to start the application and visit [http://localhost:9292](http://localhost:9292)

### Heroku
1. Run `heroku create` to create you application
2. Set you configs (see available configs in `.env.example` with `heroku config:set KEEN_PROJECT_ID=1337`
3. Deploy with `git push heroku master`
4. Run `heroku open` to open the app in your browser

## Options
### Authentication
Build in support for authentication with Google Oauth2. Set up your client id with the `GOOGLE_CLIENT_ID` environment variable and client secret with the `GOOGLE_CLIENT_SECRET`. Remove the `GOOGLE_CLIENT_ID` variable to disable authentication.

The app uses [Omniauth](https://github.com/intridea/omniauth) for authentication so it can easily be replaced/combined with other providers than the provided Google Oauth2 solution.

### Custom attributes
Show your custom Sendgrid arguments by setting the `CUSTOM_EVENT_ATTRIBUTES` environment variable with a comma separated list of attributes.

### Event counter start number
You can change the event counter's initial value by setting the `START_NUMBER` variable. This is just for visual effect.

## Contributors
* [Jonas Forsberg](http://github.com/himynameisjonas)
