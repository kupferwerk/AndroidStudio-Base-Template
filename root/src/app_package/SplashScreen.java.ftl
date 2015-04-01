package ${packageName};

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

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

   @Override
   public boolean onCreateOptionsMenu(Menu menu) {
       // Inflate the menu; this adds items to the action bar if it is present.
       getMenuInflater().inflate(R.menu.${menuName}, menu);
       return true;
   }

   @Override
   public boolean onOptionsItemSelected(MenuItem item) {
       // Handle action bar item clicks here. The action bar will
       // automatically handle clicks on the Home/Up button, so long
       // as you specify a parent activity in AndroidManifest.xml.
       int id = item.getItemId();

       //noinspection SimplifiableIfStatement
       if (id == R.id.action_settings) {
           return true;
       }

       return super.onOptionsItemSelected(item);
   }
}
