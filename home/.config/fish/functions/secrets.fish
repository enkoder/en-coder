function secrets
    op_signin
    for secret in (op list items --categories 'password' | jq -r .[].overview.title)
	set -g --export $secret (op get item $secret | jq -r .details.password)
    end
end
