<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="${packageName}">

   <uses-permission android:name="android.permission.INTERNET" />

   <application
       android:name="${relativePackage}.core.BaseApplication"
       android:allowBackup="true"
       android:icon="@mipmap/ic_launcher"
       android:label="@string/app_name"
       android:theme="@style/AppTheme">

       <activity android:name="${relativePackage}.${activityClass}"
       <#if isNewProject>
       android:label="@string/app_name"
       <#else>
       android:label="@string/title_${activityToLayout(activityClass)}"
       </#if>
       <#if buildApi gte 16 && parentActivityClass != "">android:parentActivityName="${parentActivityClass}"</#if>>
       <#if parentActivityClass != "">
       <meta-data android:name="android.support.PARENT_ACTIVITY"
           android:value="${parentActivityClass}" />
       </#if>
       <#if isLauncher>
       <intent-filter>
           <action android:name="android.intent.action.MAIN" />
           <category android:name="android.intent.category.LAUNCHER" />
       </intent-filter>
       </#if>
       </activity>
   </application>
</manifest>
