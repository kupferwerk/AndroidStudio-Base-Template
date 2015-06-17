apply plugin: 'com.android.application'
apply plugin: 'checkstyle'

android {

   packagingOptions {
      exclude 'LICENSE.txt'
   }

   compileSdkVersion 22
   buildToolsVersion "22.0.1"

   defaultConfig {
      applicationId "${packageName}"
      minSdkVersion 15
      targetSdkVersion 22
      versionCode System.getenv("BUILD_NUMBER") as Integer ?: 0
      String versionNameString = System.getenv("BUILD_NUMBER") ?: "IDE"
      versionName versionNameString
      if ("IDE".equals(versionNameString)) {
         buildConfigField "boolean", "IS_IDE_BUILD", "true"
      } else {
         buildConfigField "boolean", "IS_IDE_BUILD", "false"
      }
   }
   lintOptions {
      abortOnError false
      disable 'ContentDescription'
      disable 'InvalidPackage'
   }

   buildTypes {
      release {
         minifyEnabled false
         proguardFiles 'proguard-rules.pro'
      }
      debug {
         applicationIdSuffix ".debug"
         testCoverageEnabled true
      }
   }
}

task checkstyle(type: Checkstyle) {
   source 'src/'
   include '**/*.java'
   exclude '**/gen/**'
   classpath = files()
   reports {
      xml {
         destination "build/outputs/reports/checkstyle-results.xml"
      }
   }
}

project.gradle.taskGraph.whenReady {
   connectedAndroidTestDebug {
      ignoreFailures = true
   }
}

task checkstyleReport(dependsOn: 'checkstyle') << {
   if (file("build/outputs/reports/checkstyle-results.xml").exists()) {
      ant.xslt(in: "build/outputs/reports/checkstyle-results.xml",
            style: "config/checkstyle/checkstyle.xsl",
            out: "build/outputs/reports/checkstyle-results.html"
      )
   }
}

dependencies {
<#if includeDagger>
   provided 'com.squareup.dagger:dagger-compiler:1.2.2'
   compile 'com.squareup.dagger:dagger:1.2.2'
</#if>
   compile 'com.android.support:support-v4:22.2.0'
   compile 'com.android.support:appcompat-v7:22.2.0'
   compile 'com.android.support:recyclerview-v7:22.2.0'
   compile 'com.android.support:cardview-v7:22.2.0'
<#if includeHockeyApp>
   compile 'net.hockeyapp.android:HockeySDK:3.5.0'
</#if>
<#if includeRetrofit>
   compile 'com.squareup.okhttp:okhttp:2.3.0'
   compile 'com.squareup.okhttp:okhttp-urlconnection:2.3.0'
   compile 'com.squareup.retrofit:retrofit:1.9.0'
</#if>
<#if includeEventbus>
   compile 'de.greenrobot:eventbus:2.4.0'
</#if>
<#if includePicasso>
   compile 'com.squareup.picasso:picasso:2.5.2'
</#if>
<#if includeRxJava>
   compile 'io.reactivex:rxandroid:0.24.0'
</#if>
<#if includeKWUtils>
   compile 'net.kupferwerk:debugging:1.0.1'
   compile 'net.kupferwerk:tools:1.0.1'
</#if>
   compile 'com.jakewharton:butterknife:6.1.0'
<#if includeMockito>
   androidTestCompile 'org.mockito:mockito-core:1.10.19'
   androidTestCompile 'com.google.dexmaker:dexmaker:1.2'
   androidTestCompile 'com.google.dexmaker:dexmaker-mockito:1.2'
</#if>
   androidTestCompile 'org.hamcrest:hamcrest-core:1.3'
   androidTestCompile 'org.hamcrest:hamcrest-library:1.3'
}
