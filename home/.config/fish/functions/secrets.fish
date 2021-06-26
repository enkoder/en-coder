set SECRETS GITHUB_API_ACCESS_TOKEN

function secrets
    op_signin
    for s in $SECRETS
	set -g --export $s (op get item $s | jq -r .details.password)
    end
end
