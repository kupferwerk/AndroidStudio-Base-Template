<resources>
<#if includeHockeyApp>
   <!-- enter your hockey app id here -->
    <string name="hockey_app_id">${hockeyAppId}</string>
</#if>
<#if includeRetrofit>
   <string name="base_url">@string/release_base_url</string>
   <string name="staging_base_url">${stagingBaseUrl}</string>
   <string name="release_base_url">${releaseBaseUrl}</string>
</#if>
</resources>
