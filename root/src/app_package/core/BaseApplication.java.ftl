package ${packageName}.core;

import android.app.Application;

<#if includeDagger>
import ${packageName}.core.module.RootModule;
</#if>

public class BaseApplication extends Application {

   @Override
   public void onCreate() {
      super.onCreate();
      <#if includeDagger>
      Injector.init(getInjectionModule(), this);
      </#if>
   }

<#if includeDagger>
   protected Object getInjectionModule() {
      return new RootModule(this);
   }
</#if>
}
