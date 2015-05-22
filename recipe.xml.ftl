<?xml version="1.0"?>
<recipe>

    <copy from="config/checkstyle/checkstyle.xml" to="config/checkstyle/checkstyle.xml" />
    <copy from="config/checkstyle/checkstyle.xsl" to="config/checkstyle/checkstyle.xsl" />
    <instantiate from="build-global.gradle.ftl" to="${escapeXmlAttribute(topOut)}/build.gradle" />
    <instantiate from="build.gradle.ftl" to="${escapeXmlAttribute(projectOut)}/build.gradle" />
    <instantiate from="AndroidManifest.xml.ftl" to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
    <merge from="res/values/strings.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
    <instantiate from="res/values/colors.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
    <instantiate from="res/values/config.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/config.xml" />
    <instantiate from="res/values/styles.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
    <instantiate from="res/values/dimens.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
    <instantiate from="res/values-w820dp/dimens.xml" to="${escapeXmlAttribute(resOut)}/values-w820dp/dimens.xml" />

    <instantiate from="res/layout/toolbar.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/toolbar.xml" />
    <instantiate from="res/layout/activity_base.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/activity_base.xml" />
    <instantiate from="res/layout/activity_container.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate from="src/app_package/core/BaseApplication.java.ftl" to="${escapeXmlAttribute(srcOut)}/core/BaseApplication.java"/>
    <#if includeHockeyApp>
    <instantiate from="src/app_package/core/CrashTracker.java.ftl" to="${escapeXmlAttribute(srcOut)}/core/CrashTracker.java"/>
    </#if>
    <instantiate from="src/app_package/core/BaseActivity.java.ftl" to="${escapeXmlAttribute(srcOut)}/core/BaseActivity.java"/>
    <#if includeDagger>
        <instantiate from="src/app_package/core/Injector.java.ftl" to="${escapeXmlAttribute(srcOut)}/core/Injector.java"/>
        <instantiate from="src/app_package/core/module/RootModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/core/module/RootModule.java"/>
        <instantiate from="src/app_package/core/module/ApplicationModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/core/module/ApplicationModule.java"/>
        <instantiate from="src/app_package/core/module/WebserviceModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/core/module/WebserviceModule.java"/>
    </#if>
    <#if includeRetrofit>#
        <instantiate from="res_debug/values/config_debug.xml.ftl" to="${escapeXmlAttribute(debugResOut)}/values/config_debug.xml" />
    </#if>
    <instantiate from="src/app_package/SplashScreen.java.ftl" to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
    <#if includeMockito>
    <instantiate from="src/test_package/MockitoTestCase.java.ftl" to="${testOut}/MockitoTestCase.java" />
    </#if>
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
</recipe>
