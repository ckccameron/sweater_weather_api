# Sweater Weather

The Sweater Weather API is a project completed by [Cam Chery](https://github.com/ckccameron) for the Turing School of Software and Design. It was completed over a period of 5 days.

## Table of Contents
1. [About This Project](#about_this_project)
2. [Learning Achievements](#learning_achievements)
3. [Local Setup](#setup)
4. [Environment Setup](#environment)
5. [Endpoints](#endpoints)

## About This Project <a name="about_this_project"></a>

Sweater Weather is an API designed to expose weather forecast and road trip data that will be consumed by frontend development. The idea of this application is that users will be able to plan road trips. Users will see the current weather at their location as well as the forecasted weather at their destination. By using provided wireframes as guides to direct my workflow, I was able to retrieve data from external APIs to build this new API.

Geocoding and directions data was retrieved from [MapQuest](https://developer.mapquest.com/documentation/). Weather data for current, hourly and daily forecasts was retrieved from [OpenWeather](https://openweathermap.org/api). To fetch relevant background images for the locations as well, a search endpoint was used from [Pexels](https://www.pexels.com/api/documentation/). Gathering weather data from OpenWeather for a given location requires latitude and longitude, so that's where MapQuest's Geocoding API came into play. Once the latitude and longitude could be added as query params for OpenWeather's endpoint, I had access to a detailed breakdown of weather forecast data. I was also able to use MapQuest's Directions API to access the data needed to display for users when they create a road trip.

## Learning Achievements <a name="learning_achievements"></a>

- Aggregate data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on frontend requirements

## Local Setup <a name="setup"></a>

1. Clone this repo: `git clone https://github.com/ckccameron/sweater_weather_api.git`
2. Navigate into the project directory: `cd sweater_weather_api`
3. Install gems and dependencies: `bundle install`
4. Setup local database: `rails db:{create,migrate}`
5. Install Figaro to store your API keys: `bundle exec figaro install`

#### Versions

- Ruby 2.5.3
- Rails 5.2.4.3

## Environment Setup <a name="environment"></a>

After installing Figaro, you will see that a file has been created - *config/application.yml*.

Within this file, format your API keys exactly as you see below. Follow the links attached with each key to retrieve your own unique API keys. For each key, instead of <YOUR KEY HERE>, you'll just copy and paste your key from each website.

MAPQUEST_KEY: <YOUR KEY HERE> - [MapQuest](https://developer.mapquest.com/documentation/)
WEATHER_KEY: <YOUR KEY HERE> - [OpenWeather](https://openweathermap.org/api)
IMAGE_KEY: <YOUR KEY HERE> - [Pexels](https://www.pexels.com/login/)
  
## Endpoints <a name="endpoints"></a>

#### GET /api/v1/forecast

Example Request:
`{URL}/api/v1/forecast?location=san diego, ca`

Example Happy Path Response:
`{
    "data": {
       "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2020-11-11, 11:12",
                "sunrise": "2020-11-11, 06:15",
                "sunset": "2020-11-11, 04:49",
                "temperature": 53.55,
                "feels_like": 51.04,
                "humidity": 71,
                "uvi": 3.68,
                "visibility": "6.21 mi",
                "conditions": "clear sky",
                "icon": "http://openweathermap.org/img/wn/01n.png"
            },
            "daily_weather": [
                {
                    "date": "2020-11-12, 11:00",
                    "sunrise": "2020-11-12, 06:16",
                    "sunset": "2020-11-12, 04:49",
                    "max_temp": 65.68,
                    "min_temp": 56.61,
                    "conditions": "clear sky",
                    "icon": "http://openweathermap.org/img/wn/01d.png"
                },
                {
                    "date": "2020-11-13, 11:00",
                    "sunrise": "2020-11-13, 06:17",
                    "sunset": "2020-11-13, 04:48",
                    "max_temp": 63.9,
                    "min_temp": 59.02,
                    "conditions": "clear sky",
                    "icon": "http://openweathermap.org/img/wn/01d.png"
                },
              ...
            ],
            "hourly_weather": [
                {
                    "time": "12:00",
                    "temperature": 56.71,
                    "feels_like": 54.46,
                    "wind_speed": "2 miles per hour",
                    "wind_direction": "W",
                    "conditions": "scattered clouds",
                    "icon": "http://openweathermap.org/img/wn/03n.png"
                },
                {
                    "time": "01:00",
                    "temperature": 58.48,
                    "feels_like": 55.78,
                    "wind_speed": "3 miles per hour",
                    "wind_direction": "W",
                    "conditions": "broken clouds",
                    "icon": "http://openweathermap.org/img/wn/04n.png"
                },
              ...
            ]
        }
    }
}`

#### GET /api/v1/background

Example Request:
`{URL}/api/v1/background?location=denver, co`

Example Happy Path Response:
`{
    "data": {
        "id": null,
        "type": "background_image",
        "attributes": {
            "location": "denver, co",
            "image_url": "https://www.pexels.com/photo/union-station-building-2706750/",
            "credit": {
                "source": "https://www.pexels.com",
                "author": "Thomas Ward",
                "author_portfolio": "https://www.pexels.com/@thomasleeward",
                "logo": "https://images.pexels.com/lib/api/pexels.png"
            }
        }
    }
}`

#### POST /api/v1/users

Example Request:
`{URL}/api/v1/users`

Example Request Body:
`{
  "email": "boom@shakalaka.com",
  "password": "123pass",
  "password_confirmation": "123pass"
}`

Example Happy Path Response:
`{
    "data": {
        "id": "3",
        "type": "users",
        "attributes": {
            "email": "boom@shakalaka.com",
            "api_key": "<unique api key is shown here>"
        }
    }
}`

Example Sad Path Response:
`{
    "data": {
        "id": null,
        "type": "error",
        "attributes": {
            "message": "Your credentials are bad"
        }
    }
}`

#### POST api/v1/sessions

Example Request:
`{URL}/api/v1/sessions`

Example Request Body:
`{
  "email": "boom@shakalaka.com",
  "password": "123pass"
}`

Example Happy Path Response:
`{
    "data": {
        "id": "3",
        "type": "users",
        "attributes": {
            "email": "boom@shakalaka.com",
            "api_key": "<unique api key is shown here>"
        }
    }
}`

Example Sad Path Response:
`{
    "data": {
        "id": null,
        "type": "error",
        "attributes": {
            "message": "Your credentials are bad"
        }
    }
}`

#### POST /api/v1/road_trip

 Example Request:
 `{URL}/api/v1/road_trip`
 
 Example Request Body:
`{
  "origin": "Los Angeles, CA",
  "destination": "San Diego, CA",
  "api_key": "<unique api key is shown here>"
}`

Example Happy Path Response:
`{
    "data": {
        "id": null,
        "type": "road_trip",
        "attributes": {
            "origin": "Los Angeles, CA",
            "destination": "San Diego, CA",
            "travel_time": "01 hr, 58 min",
            "weather_at_eta": {
                "temperature": 57.87,
                "conditions": "broken clouds"
            }
        }
    }
}`

## Contributor <a name="contributor"></a>

Cam Chery
[<img align="left" alt="cam github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-cam]
[<img align="left" alt="cam linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-cam]

[git-cam]: https://github.com/ckccameron
[linkedin-cam]: https://www.linkedin.com/in/cameronchery/
