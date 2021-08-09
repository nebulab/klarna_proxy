# Klarna SDK

This is a non-complete implementation of the Klarna Credit and Klarna Order Management API.

## Development

To work properly the library needs credentials for the Klarna API. In development these credentials are read from the environment. In an actual application they are passed in as options to the `Klarna::Client`. There must be two variables set when running the tests or the dummy app:

- `KLARNA_API_KEY`
- `KLARNA_API_SECRET`

Both can be obtained from Klarna. There's a third option to set the region; currently tested are `us` (default) and `uk`.

- `KLARNA_REGION`

### Dummy HTTP app

The gem comes with a dummy Sinatra app that's used in the specs and can also be used for manual testing against the API. That's because some calls to the API require an `authorization_token` which can only be obtained by running frontend code in an iFrame. To run the app, simply execute `bin/app`.

### Testing

The tests can be executed via `rake`.
