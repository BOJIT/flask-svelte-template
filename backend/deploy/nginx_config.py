# Simple script to programatically set the API forwarding configuration in NGINX

import json
import crossplane

payload = crossplane.parse('/etc/nginx/nginx.conf')

snippet = {
	"directive": "location",
	"args": [
		"/api"
	],
	"block": [
		{
			"directive": "include",
			"args": [
				"proxy_params"
			]
		},
		{
			"directive": "proxy_pass",
			"args": [
				"http://unix:home/pi/app/app.sock"
			]
		}
	]
}

# Extract server config
for c_index, config in enumerate(payload["config"]):
	if config["file"] == "/etc/nginx/sites-enabled/default":
		break
else:
	raise Exception("Error: No default sites-enabled file!")

for p_index, parsed in enumerate(config["parsed"]):
	if parsed["directive"] == "server":
		break
else:
	raise Exception("Error: No server configured!")

# Remove existing location redirect if present
for l_index, location in enumerate(parsed["block"]):
	if location["directive"] == "location":
		if location["args"][0] == "/api":
			payload["config"][c_index]["parsed"][p_index]["block"].pop(l_index)
			break

# Add location redirect
payload["config"][c_index]["parsed"][p_index]["block"].append(snippet)

# Write back configuration data
with open('nginx_config.json', 'w') as outfile:
	json.dump(payload, outfile)
