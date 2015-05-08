// Top-level build file where you can add configuration options common to all sub-projects/modules.

buildscript {
    repositories {
        jcenter()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:1.2.3'
    }
}

allprojects {
    repositories {
<#if includeKWUtils>
        maven {
            url "https://nexus.kupferwerk.net/content/groups/public/"
            credentials {
                username = '${kwMavenUser}'
                password = '${kwMavenPassword}'
            }
        }
</#if>
        maven { url 'http://dl.bintray.com/populov/maven' }
        jcenter()
    }
}
