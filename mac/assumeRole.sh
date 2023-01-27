#!/bin/zsh

USAGE="$0 --account <account> --role <role>"

if [[ "$#" != 4 ]]; then
    echo $USAGE >&2
    return
fi

if [[ "$1" == "--account" && "$3" == "--role" ]]; then
    ACCOUNT=$2
    ROLE=$4
elif [[ "$1" == "--role" && "$3" == "--account" ]]; then
    ROLE=$2
    ACCOUNT=$4
else
    echo $USAGE >&2
    return
fi

for s in $(curl -sS -b ~/.midway/cookie -c ~/.midway/cookie -L -X POST \
    --header "X-Amz-Target: IsengardService.GetAssumeRoleCredentials" \
    --header "Content-Encoding: amz-1.0" \
    --header "Content-Type: application/json; charset=UTF-8" \
    -d "{\"AWSAccountID\": \"$ACCOUNT\", \"IAMRoleName\":\"$ROLE\"}" \
    https://isengard-service.amazon.com |
    jq -r '.AssumeRoleResult|fromjson|.credentials|
            ["AWS_ACCESS_KEY_ID=\(.accessKeyId)",
            "AWS_SECRET_ACCESS_KEY=\(.secretAccessKey)",
            "AWS_SESSION_TOKEN=\(.sessionToken)"][]'); do
    export $s
done
