# Sweater Weather
![image](https://user-images.githubusercontent.com/92954894/173646734-82c4e6dd-dbe0-44f9-8e68-649f1450864d.png)

# Table of Contents

### [Getting Started :runner:](#getting-started)
### [Calling Endpoints :telephone_receiver:](#calling-endpoints)
### [Built With :hammer_and_wrench:](#built-with)

# Getting Started
  
* Clone this repo
* `bundle install`
* `bundle exec figaro install`
* `rails db:{create,migrate,seed}`
* Get API keys for the following external APIs:
  * [Map Quest's GeoCoding API](https://developer.mapquest.com/documentation/geocoding-api/)
  * [OpenWeather One Call API ](https://openweathermap.org/api/one-call-api)
  * [Unsplash Photo API](https://unsplash.com/developers)
* Store your keys in application.yml
  * mapquest_api_key: your_key
  * openweather_api_key: your_key
  * unsplash_api_key: your_key
  
  ## Available Endpoints - Postman Collection
* [Click this link](https://www.getpostman.com/collections/e300ab67bc182a9573c0)
* Copy the URL
* Open Postman, select "Import" from top left of page, then "Link" from the top line
* Paste the URL
* Click "Continue", then "Import"
* Check out the endpoints exposed by this API, incuding happy and sad paths!
  
# BUILT WITH
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />  <img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white" />  <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/> <img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white" /> <img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white" /> <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" />      
  
#### :gem: Additional Gems :gem:
Capybara |
Faraday |
VCR |
Webmock |
Shoulda Matchers |
SimpleCov |
Figaro
