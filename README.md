# RitoPlz
[![Build Status](https://travis-ci.org/gjh33/RitoPlz.svg?branch=master)](https://travis-ci.org/gjh33/RitoPlz)

RitoPlz is an independently developed easy to use API wrapper for Riot Games API.
The main goal of this project is to provide a very clean, easy to use API which should not result in any frustration. Should you find yourself frustrated please open a Bug Report so I can make the necessary changes. The source code should also be simple and easy to read.

##Goals
The goals for this project are very important. If you feel the project is not meeting these goals, please make a bug report or fork the project.

* Simplicity. This wrapper should be stupid simple. No meta programming. No hidden bullshit. Very clear. If you dont like something about this gem, you should be able to manipulate it without issue to your needs.
* Well documented. You should have no questions if you've read all the documentation on github. You should never be confused, and this should all be very easy.
* No frustration. The reason for the first 2 goals is to minimize frustration. I'm sick and tired of using API wrappers only to find they lack a feature, or have a bug, and it's impossible to figure out why.
* Barebones. This should be barebones and as close to riot's api as possible. No model associations, no fancy features. This gem should be what you use when you want to make a fancier wrapper.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'RitoPlz'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install RitoPlz

## Usage

### Configuration
Before using RitoPlz you must first configure the application with your api key. Other configuration options are available and will be listed below

```ruby
RitoPlz.configure do |config|
  config.api_key = "my_awesome_riot_api_key" #your secret api key provided to you by riot
  config.default_region = :na #default region when building the client
end
```

It's recommended to never commit your api key. A good practice is to use environment variables. For dev use `gem 'dot-env'` to configure environment variables, then on your production server set an environment variable. Ruby has a built in `ENV['KEY']` command to access environment variables. For example:
```ruby
RitoPlz.configure do |config|
  config.api_key = ENV['RIOT_SECRET_KEY'] #Where 'RIOT_SECRET_KEY' is the name of your environment variable
end
```

### Building the client
All api calls should be made through the client. Though it is possible to instantiate the endpoint classes directly, it is recommended you use the client which provides default configuration and a clean interface for making calls. You can build the client like so:
```ruby
client = RitoPlz::Client.new #Client with the region set to the configured default region (by default :na)
client = RitoPlz::Client.new(region: :euw) #Client with a region different from the default region
```
Clients are bound to the region you instantiate them with. If your application requires the use of multiple regions, It's recommended you create a client for each region you'll require. Clients are not heavy and can be created frequently without worry.

### Making an api call
This API wrapper is designed to closely mimick the api documentation on Riot's website. It's recommended that you read through their documentation when using this wrapper. For example if you wanted to make a call to summoner api and get a summoner by name, on Riot's site they provide the documenation for "/api/lol/{region}/v1.4/summoner/by-name/{summonerNames}". In RitoPlz you would write
```ruby
client = RitoPlz::Client.new
client.summoner.by_names("summonerA", "summonerB")
```
The API endpoints return response objects from the net/http standard ruby library. This way you have full access to all the response data, headers, and more.

The best way to learn to use the api wrapper, is to type what feels natural when reading the riot api. If that doesn't work, read the source code. It's very easy to understand. Every endpoint is in a class inside lib/RitoPlz/API/. Reading that class you'll see the available methods. This wrapper is designed to be stupid simple, so you should have no trouble reading, expanding upon, and tinkering with the code.

To see more in depth documentation, read the readme inside RiotPlz/API/

## Development

Clone the git repository and then run 'bundle install'. The project should now run. You can check to be sure by running 'rspec' and checking all tests are passing.

You have access to a console courtesy of pry in bin/console

## Contributing

1. Fork it ( https://github.com/[my-github-username]/RitoPlz/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
