response="$(
      timeout -s 9 1 \
      redis-cli \
        -a "${REDIS_PASSWORD}" --no-auth-warning \
        -h "${REDIS_ADDR}" \
        -p 6379 \
        ping
    )"
if [[ "${response}" != "PONG" ]] && [[ "${response}" != "LOADING Redis is loading the dataset in memory" ]]; then
  echo "${response}"
  exit 1
fi
