# boxes-runner

This is a project that wraps up all of the requirements to run the "standard
set" of [boxes][] builds. It's intended to be placed into [Jenkins][] (or
similar) and run periodically. It takes the output from a run and uploads the
artifacts to [Atlas][] using [atlas-ruby][].

`jenkins.sh` holds the script which is used in production.

## Usage

This has two stages to it. `bootstrap` configures the environment by fetching
the latest release of [boxes][]. `run` is a simplification of the build →
configure → upload flow.

```sh
git clone git://github.com/nickcharlton/boxes-runner.git
cd boxes-runner

bundle exec bin/boostrap
bundle exec bin/run wheezy64-standard
```

Given the nature of run (executing the builds), it aims to fail quickly so the
tool running it can mark it as failed and move on, aiming to avoid leaving
things in a funny state.

## Author

Copyright (c) 2015 Nick Charlton <nick@nickcharlton.net>

[boxes]: https://github.com/nickcharlton/boxes
[Jenkins]: http://jenkins-ci.org
[Atlas]: https://atlas.hashicorp.com
[atlas-ruby]: https://github.com/nickcharlton/atlas-ruby
