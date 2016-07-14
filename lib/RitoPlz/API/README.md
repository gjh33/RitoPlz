# RitoPlz API Documentation

## Method Naming Convention
RitoPlz has a somewhat simple naming convention. RitoPlz follows the riot api documentation. However there are a few exceptions where Riot's documentation doesn't suit the needs of an abstract api wrapper. We'll cover these rules here. Alternatively you could just go read the source code and figure out what all the methods are called.

### ID values
When an api call requires ID values to be passed, the endpoint is named based on ambiguity. For example, if you want to get champion data by id, you can call
```ruby
client = RitoPlz::Client.new
client.champion.by_id
```
Here RitoPlz uses `by_id` because it is clear who the id belongs to. If not specified the id belongs to the name of the api, in this case "champion". However in another case where the id value is ambiguous like in the league api, RitoPlz uses the convention of `by_resource_id`. For example if you wanted to get the league data for a player:
```ruby
client = RitoPlz::Client.new
client.league.by_player_id(1)
```
As you can see since the id doesn't belong to the league itself, RitoPlz names the id.

Sometimes more complexity is needed. For example lets say you want the runs for a specific summoner. Here you must request the resource by the id.
```ruby
client = RitoPlz::Client.new
client.summoner.runes_by_player_ids(1, 2, 3, 4)
```

### All resources
When an api returns all resources, RitoPlz uses simlar convention to IDs. When it's not ambiguous and the requested resource matches the name of the api, you can simply call `all`. An example is the champion api:
```ruby
client = RitoPlz::Client.new
client.champion.all
```
However when it's ambiguous what's being requested, RiotPlz uses `all_resources` convention. For example:
```ruby
client = RitoPlz::Client.new
client.static_data.all_champions
```

### Multiple parameters
Some Riot APIs take a list of names, ids, etc in an api call. RitoPlz supports this using ruby's * operator. You can provide the list directly in the arguments, or pass an array. For example:
```ruby
client = RitoPlz::Client.new
client.league.by_player_ids(0, 1, 2, 3) #passed directly

player_ids = [0, 1, 2, 3]
client.league.by_player_ids(player_ids) #passed as an array
```

### Special APIs
Some of Riot's APIs are special to a specific resource. For example champion mastery. RitoPlz handles this by passing the param to the api object upon instantiation. When calling from the client, the argument goes in the direct method call like so:
```ruby
client = RitoPlz::Client.new
client.champion_mastery(288831).all_champions #the player id is passed into the first method call, and all chained methods after will use that id
```

Right now there are only two that do this: stats, and championmastery

### Optional parameters
Optional parameters are easy with RitoPlz. Let's use matchlist as an example. You can pull up the api on Riot's site to see what's up.
```ruby
client = RitoPlz::Client.new
client.match_list.by_player_id(beginIndex: 1000, endIndex: 5000, seasons: [:SEASON2014, :SEASON2015, :SEASON2016])
```
The optional parameters are simply passed in as a hash to the endpoint. Easy right? Your arrays are automatically converted to a comma seperated string that Riot's API will receive.

### Tournament API
Riot's tournament api made it difficult for RitoPlz to use the usual convention. I recommend reading the source code, however I will do my best to explain.

Some API require body and query params. RitoPlz combines these into 1 hash for parameters. If the parameter is a path parameter (in the path for the api call, not params) then it is a mandatory parameter for the method. The only exception being generating a tournament code. For this api, tournamentId is a mandatory param despite it not being part of the path, but part of the body. This choice was made because the other code apis use the tournamentId in the path. Riot's inconsistancy forced my hand here. Here are the method signatures so you can be clear what can be called. Anything in "params" is part of the body or query params. See Riot's official API doc for these values.
```ruby
generate_code(tournament_id, params) # Example params: { teamSize: 5, spectatorType: :ALL, pickType: :BLIND_PICK, mapType: :SUMMONERS_RIFT, count: 5 }
get_code_info(tournament_code)
update_code_info(tournament_code, params) # Similar params to generate_code. See Riot API for possible params
get_lobby_events(tournament_code)
create_provider(params) # Example params: { url: 'http://www.test.com/riot_response_handler' }. you can pass region, but it will default to your client's region if you dont
create_tournament(params) # Example params: { name: 'MyTournament', providerId: 000 }
```
