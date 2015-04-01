# AndroidStudio-Base-Template

This project contains a Android Studio template to create a basic Kupferwerk Android app.

##Installation
- Clone this repository to the following directory depending on your machine:

*MacOS*
```
/Applications/Android Studio.app/Contents/plugins/android/lib/templates/activities/
```

*Windows*
```
C:/Users/<<username>>/AppData/Local/Android/android-studio/plugins/android/lib/templates/activities/
```

- Restart Android Studio

## Usage
1. Open Android Studio and create a new android project.
2. After adding your project information and the targeted android devices you will see the options to add an activity on the next screen.
3. Choose the Option "Kupferwerk Base App Template". ![Choose Options](https://github.com/kupferwerk/AndroidStudio-Base-Template/blob/master/doc/choose_base_app.png)
4. In the next screen you could modify the template. The template generates one activity with the entered parameters. Additionally the following feature could be added:
  - Square Dagger for dependency injection
  - Square Picasso for imageloading
  - Square Retrofit for webservice connection
  - GreenRobot Eventbus
  - Netflix RxJava for reactive pattern development
  - HockeyApp for crash- and updatemanagement.
  - Mockito for mocking
  - Integration of some Kupferwerk internal libraries. These libraries are hosted in the private Kupferwerk maven repository. You should provide some credentials in this case.
5. Start the generation.

![Choose Features](https://github.com/kupferwerk/AndroidStudio-Base-Template/blob/master/doc/choose_options.png)

## Important Notes!
This template is added as an Activity-template for Android Studio. This means that it is also possible integrate this template from New -> Activity menu again. **This is not recommended since this template will explicitly override some files (e.g. build.gradle, AndroidManifest.xml) without confirmation.**
