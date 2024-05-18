# juice_code_test

Juice Code Test

<h1> Tabel Of Content</h1>
<ol>
  <li>
    Prerequisites
  </li>
  <li>
    Buil and run 
  </li>
  <li>
    Run integration test
  </li>
</ol>

# Prerequisites
Make sure that the following is installed on your system:

A clone of this repository.
Recent flutter sdk.

Android
Android Studio
iOS (only available for Apple computers, e.g. MacBook, iMac)
XCode


# Buil and run 
Open this project in android studio or vs code.
Select chrome in flutter device selection.
You can start testing by running the app.

# Run integration test
To run the integration test you need run chromedriver first
if your mac haven't installed chromedrive you can download here 
https://googlechromelabs.github.io/chrome-for-testing/

first run this command at chromedriver location 
./chromedriver --port=4444
and 
run this command at project directory 
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/main_test.dart -d web-server
