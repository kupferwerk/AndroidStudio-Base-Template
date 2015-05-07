package ${packageName};

import android.os.Bundle;

<#if includePicasso>
import com.squareup.picasso.Picasso;
</#if>

<#if includeDagger>
import javax.inject.Inject;
</#if>

import ${packageName}.core.BaseActivity;
<#if includeDagger>
<#if includeHockeyApp>
import ${packageName}.core.CrashTracker;
</#if>
import ${packageName}.core.Injector;
<#if includeRetrofit>
import retrofit.RestAdapter;
</#if>
</#if>

public class ${activityClass} extends BaseActivity {

<#if includeDagger>
<#if includePicasso>
   @Inject
   Picasso picasso;
</#if>

<#if includeRetrofit>
   @Inject
   RestAdapter restAdapter;
</#if>
<#if includeHockeyApp>
   @Inject
   CrashTracker crashTracker;
</#if>
</#if>

   @Override
   protected void onCreate(Bundle savedInstanceState) {
      setContentView(R.layout.${layoutName});
      super.onCreate(savedInstanceState);
      <#if includeDagger>
      Injector.inject(this);
      </#if>
   }
}
