apply plugin: 'com.android.application'
apply plugin: 'checkstyle'

android {

   packagingOptions {
      exclude 'LICENSE.txt'
   }

   compileSdkVersion 23
   buildToolsVersion "22.0.1"

   defaultConfig {
      applicationId "${packageName}"
      minSdkVersion 16
      targetSdkVersion 23
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
   compile 'com.android.support:appcompat-v7:23.0.1'
   compile 'com.android.support:recyclerview-v7:23.0.1'
   compile 'com.android.support:cardview-v7:23.0.1'
<#if includeHockeyApp>
   compile 'net.hockeyapp.android:HockeySDK:3.6.0-b.1'
</#if>
<#if includeRetrofit>
   compile 'com.squareup.okhttp:okhttp:2.5.0'
   compile 'com.squareup.okhttp:okhttp-urlconnection:2.5.0'
   compile 'com.squareup.retrofit:retrofit:1.9.0'
</#if>
<#if includeEventbus>
   compile 'de.greenrobot:eventbus:2.4.0'
</#if>
<#if includePicasso>
   compile 'com.squareup.picasso:picasso:2.5.2'
</#if>
<#if includeRxJava>
   compile 'io.reactivex:rxandroid:1.0.1'
</#if>
<#if includeKWUtils>
   compile 'net.kupferwerk:debugging:1.0.1'
   compile 'net.kupferwerk:tools:1.0.2'
</#if>
   compile 'com.jakewharton:butterknife:7.0.1'
<#if includeMockito>
   androidTestCompile 'org.mockito:mockito-core:1.10.19'
   androidTestCompile 'com.google.dexmaker:dexmaker:1.2'
   androidTestCompile 'com.google.dexmaker:dexmaker-mockito:1.2'
</#if>
   androidTestCompile 'org.hamcrest:hamcrest-core:1.3'
   androidTestCompile 'org.hamcrest:hamcrest-library:1.3'
}
