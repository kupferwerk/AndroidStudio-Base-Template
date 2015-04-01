package ${packageName}.core;

import android.annotation.TargetApi;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;

import ${packageName}.R;

public class BaseActivity extends ActionBarActivity {

   public int getStatusBarHeight() {
      int result = 0;
      int resourceId = getResources().getIdentifier("status_bar_height", "dimen", "android");
      if (resourceId > 0) {
         result = getResources().getDimensionPixelSize(resourceId);
      }
      return result;
   }

   @TargetApi (Build.VERSION_CODES.KITKAT)
   public void setStatusBarColor() {
      if (Build.VERSION.SDK_INT < Build.VERSION_CODES.KITKAT ||
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
         return;
      }
      View statusBar = findViewById(R.id.statusBarBackground);
      if (statusBar == null) {
         return;
      }
      Window window = getWindow();
      window.setFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS,
            WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
      int statusBarHeight = getStatusBarHeight();
      if (statusBarHeight != 0) {
         int color = getResources().getColor(R.color.primary_dark);
         statusBar.getLayoutParams().height = +statusBarHeight;
         statusBar.setBackgroundColor(color);
         statusBar.setVisibility(View.VISIBLE);
      } else {
         statusBar.setVisibility(View.GONE);
      }
   }

   @Override
   protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      View toolBarView = findViewById(R.id.toolbar);
      if (toolBarView != null) {
         setSupportActionBar((Toolbar) toolBarView);
      }
      setStatusBarColor();
   }
}
