This project basically run some tests on multiple devices using the Sauce Labs test infrastructure.

### Setup

1. Set Sauce Credentials
    * In the terminal export your Sauce Labs Credentials as environmental variables:
    ```
    $ export SAUCE_USERNAME=<your Sauce Labs username>
    $ export SAUCE_ACCESS_KEY=<your Sauce Labs access key>
    ```
    * BUILD_TAG is optional:
    ```
    $ export BUILD_TAG=sauce_automated_build_name
    ```
2. Project Dependencies
	* Install packages (Use sudo if necessary):
	```
	$ bundle install
	```
### Running Tests

Tests in a specific device:
```
$ rake google_nexus_7c
```  
Tests in Parallel:
```
$ rake test_sauce
```

This project was based on [Ruby-RSpec-Selenium](https://github.com/saucelabs-sample-test-frameworks/Ruby-RSpec-Selenium)
