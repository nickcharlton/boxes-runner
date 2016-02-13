# boxes-runner

This project makes running the standard set of [boxes][] builds running easily.
It provides scripts for configuring [Jenkins][] and for running locally.

It can create a Jenkins job for each of the builds listed inside `boxes.yml`
(with `configure_jobs`) and runs a build, taking the output and
uploading it to [Atlas][] (using [atlas-ruby][]) (with `run`). With `local`, it
can parse `boxes.yml` and run a single build or all builds.

`jenkins.sh` gives the script used to spawn the initial configuration job.

## Usage

The expectation is that this project maintains all of the Jenkins jobs, so when
changes are made here, they will be automatically propagated across the Jenkins
instance. Otherwise it's a case of configuring some 8 or more jobs manually.

This project should be setup in Jenkins to run on each push, using something
like the script contained in `jenkins.sh`.

### Environment Variables

* `JENKINS_USERNAME`: Username to login to the local Jenkins instance.
* `JENKINS_PASSWORD`: Password for the above user.
* `NOTIFICATION_EMAIL`: Email address to configure for build failure
  notifications.

* `BOXES_BUILD_TIME`: Used to coordinate the time a set of builds is run.
* `ATLAS_USER`: The user under which the box should be handled.
* `ATLAS_TOKEN`: Token for accessing Atlas.

### Locally

Whilst the above is relevant when using with Jenkins, running locally is
similar. e.g.:

```sh
$ bin/local --list
precise64-standard (puppet.sh, chef.sh)
precise64-ansible (ansible.sh)
precise64-chef (chef.sh)
```

```sh
$ bin/local --run precise64-standard
Starting build for: ruby-box-virtualbox...
ruby-box-virtualbox output will be in this color.
[ ... ]
```

Run `bin/local --help` to see the other arguments.

## Author

Copyright (c) 2015 Nick Charlton <nick@nickcharlton.net>

[boxes]: https://github.com/nickcharlton/boxes
[Jenkins]: http://jenkins-ci.org
[Atlas]: https://atlas.hashicorp.com
[atlas-ruby]: https://github.com/nickcharlton/atlas-ruby
