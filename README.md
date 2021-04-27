# website-screenshoter

Example application for wsp-aws.io.

Website screenshoting service powered by https://www.npmjs.com/package/manet 

# Configuration options (environment variables)

* PORT: port to listen (default is 80)
* DEBUG_LEVEL: silly, debug (default), verbose, info, warn, error
* ENGINE: slimerjs (default) or phantomjs
* USER: user for HTTP Basic Auth
* PASSWORD: if set, HTTP Basic Auth will be activated

# WSP AWS Manifest example
On application registration, if there is a file .deploy.aws.environmentName, WSP AWS will parse it and prefill the UI form with values from this file.