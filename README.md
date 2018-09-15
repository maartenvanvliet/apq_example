# ApqExample

Full example of integration Apq with Absinthe

## Installation

Clone the repo and run `mix deps.get` and then `iex -S mix` to run the app.
In another terminal go to the `static` folder and run `yarn install` and then `yarn start`.

Go to `http://localhost:3001` and watch in your console how the first request fails with an error, it is then retried to fill the cache. After a refresh the app only needs one request.

