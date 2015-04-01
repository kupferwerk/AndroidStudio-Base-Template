package ${packageName}.core.module;

import android.content.Context;

<#if includeRetrofit>
import com.squareup.okhttp.Cache;
import com.squareup.okhttp.OkHttpClient;
</#if>
<#if includePicasso>
import com.squareup.picasso.Picasso;
import java.util.concurrent.Executors;
</#if>

import java.io.File;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import ${packageName}.BuildConfig;
import ${packageName}.R;
<#if includeRetrofit>
import retrofit.RestAdapter;
import retrofit.client.OkClient;
</#if>

@Module (complete = false, library = true)
public class WebserviceModule {

   public static final int CACHE_SIZE = 25 * 1024 * 1024;

<#if includePicasso>
   /* TODO: Add here provides methods for retrofit interfaces. */


  @Provides
   @Singleton
   Picasso providePicasso(Context context) {
      Picasso.Builder imageLoaderBuilder = new Picasso.Builder(context);
      imageLoaderBuilder.executor(Executors.newSingleThreadExecutor());
      return imageLoaderBuilder.build();
   }
</#if>

<#if includeRetrofit>
   @Provides
   @Singleton
   RestAdapter provideRestAdapter(Context context) {
      RestAdapter.Builder builder = new RestAdapter.Builder();
      builder.setEndpoint(context.getString(R.string.base_url));
      if (BuildConfig.DEBUG) {
         builder.setLogLevel(RestAdapter.LogLevel.FULL);
      } else {
         builder.setLogLevel(RestAdapter.LogLevel.NONE);
      }
      OkHttpClient client = getHttpClient(context);
      builder.setClient(new OkClient(client));
      return builder.build();
   }

   private OkHttpClient getHttpClient(Context context) {
      final File cacheDirectory = new File(context.getCacheDir().getAbsolutePath(), "HttpCache");
      final Cache cache = new Cache(cacheDirectory, CACHE_SIZE);
      final OkHttpClient client = new OkHttpClient();
      client.setCache(cache);
      return client;
   }
</#if>
}
