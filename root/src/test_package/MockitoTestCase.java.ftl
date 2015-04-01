package ${packageName};

import android.test.AndroidTestCase;

public class MockitoTestCase extends AndroidTestCase {

   @Override
   protected void setUp() throws Exception {
      super.setUp();
      System.setProperty("dexmaker.dexcache", getContext().getCacheDir().toString());
   }
}
