# README
## How to set up
- bundle install
- brew install redis

## Reference
[Hotwire](https://turbo.hotwired.dev/handbook/introduction)
[Hotrails](https://www.hotrails.dev/turbo-rails)

## Note
- In the video, it empties the `create.turbo_stream.erb` to prevent duplicate render a message while in this repo the turbo seems fix the bug.
- In the video, the author tries to update the message content in the console and ActionCable send out the broadcast to the broweser in order to rerender the message, but I cannot make it by following his steps. I guess is due to the configuration in `cable.yml`, which sets develop env as `:async`, so I update it by using redis and then the browser finally can receive the broadcast and show the latest changes.