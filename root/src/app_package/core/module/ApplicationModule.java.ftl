package ${packageName}.core.module;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import ${packageName}.core.BaseApplication;
<#if includeHockeyApp>
import ${packageName}.core.CrashTracker;
</#if>

@Module (complete = false, library = true)
public class ApplicationModule {

<#if includeHockeyApp>
   @Provides
   @Singleton
   CrashTracker provideCrashTracker(BaseApplication application) {
      CrashTracker crashTracker = new CrashTracker(application);
      crashTracker.init();
      return crashTracker;
   }
</#if>

   /* TODO: Add here more application specific provided objects. */
}
