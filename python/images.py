import urllib.request


import requests
import json

req = requests.get('http://pokeapi.co/api/v2/pokemon?limit=107&offset=386')
print("HTTP Status Code: " + str(req.status_code))
json_response = json.loads(req.content)
for pokemon in json_response["results"]:
    name = pokemon["name"].capitalize()
    req2 = requests.get('http://pokeapi.co/api/v2/pokemon/' + pokemon["name"])
    json_pokemon = json.loads(req2.content)
    icon_url = json_pokemon['sprites']['versions']['generation-vii']['icons']['front_default']
    urllib.request.urlretrieve(icon_url, "../www/images/" + name + ".png")
    print(f"{name} : " + u'\u2713')
    

