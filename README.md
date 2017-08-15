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
	
### Upload APK file to Sauce Labs

To upload the APK file, run the following command:

```
curl -u <sauce_username>:<sauce_access_key> -X POST -H "Content-Type: application/octet-stream" https://saucelabs.com/rest/v1/storage/<sauce_username>/grana.apk?overwrite=true --data-binary @grana.apk
```
	
### Using docker

If you want to build your own image, run the following command:

```
docker build -t <your_tag> Dockerfile
```

To access the container, run the following commands:

```
docker run -it -d --name <your container> -e SAUCE_USERNAME="<your Sauce Labs username>" -e SAUCE_ACCESS_KEY="<your Sauce Labs access key>" <your_image>
docker exec -it <your container> bin/bash
cd home/mobile-tests-on-multiple-devices
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
