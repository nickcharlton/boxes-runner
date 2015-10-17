# boxes-runner

This small project gets the standard [boxes][] builds running inside
[Jenkins][]. It creates a Jenkins job for each of the builds listed inside
`boxes.yml` (with `configure_jobs`) and runs a build, taking the output and
uploading it to [Atlas][] (using [atlas-ruby][]) (with `run`).

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

## Author

Copyright (c) 2015 Nick Charlton <nick@nickcharlton.net>

[boxes]: https://github.com/nickcharlton/boxes
[Jenkins]: http://jenkins-ci.org
[Atlas]: https://atlas.hashicorp.com
[atlas-ruby]: https://github.com/nickcharlton/atlas-ruby
