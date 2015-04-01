package ${packageName}.core.module;

import android.content.Context;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import ${packageName}.${activityClass};
import ${packageName}.core.BaseApplication;

@Module (includes = {WebserviceModule.class, ApplicationModule.class},
      injects = {BaseApplication.class, ${activityClass}.class})
public class RootModule {

   private Context context;
   private BaseApplication application;

   public RootModule(BaseApplication application) {
      this.application = application;
      this.context = application.getApplicationContext();
   }

   public RootModule() {
      // Need to provide a default constructor for using dependency injection in tests.
      // In this case the TestModule(s) have to provide the Context and the BaseApplication.
   }

   @Provides
   @Singleton
   BaseApplication provideBaseApplication() {
      return application;
   }

   @Provides
   @Singleton
   Context provideContext() {
      return context;
   }
}
