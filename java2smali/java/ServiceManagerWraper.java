package cn.wjdiankong.hookpms;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import android.content.Context;
import android.content.pm.PackageManager;
import android.util.Log;

/**
 * Created by jiangwei1-g on 2016/9/7.
 */
public class ServiceManagerWraper {
	
    public static void hookPMS(Context context, String signed, String appPkgName, int hashCode){
        try{
            // 获取全局的ActivityThread对象
            Class<?> activityThreadClass = Class.forName("android.app.ActivityThread");
            Method currentActivityThreadMethod = 
            		activityThreadClass.getDeclaredMethod("currentActivityThread");
            Object currentActivityThread = currentActivityThreadMethod.invoke(null);
            // 获取ActivityThread里面原始的sPackageManager
            Field sPackageManagerField = activityThreadClass.getDeclaredField("sPackageManager");
            sPackageManagerField.setAccessible(true);
            Object sPackageManager = sPackageManagerField.get(currentActivityThread);
            // 准备好代理对象, 用来替换原始的对象
            Class<?> iPackageManagerInterface = Class.forName("android.content.pm.IPackageManager");
            Object proxy = Proxy.newProxyInstance(
                    iPackageManagerInterface.getClassLoader(),
                    new Class<?>[] { iPackageManagerInterface },
                    new PmsHookBinderInvocationHandler(sPackageManager, signed, appPkgName, 0));
            // 1. 替换掉ActivityThread里面的 sPackageManager 字段
            sPackageManagerField.set(currentActivityThread, proxy);
            // 2. 替换 ApplicationPackageManager里面的 mPM对象
            PackageManager pm = context.getPackageManager();
            Field mPmField = pm.getClass().getDeclaredField("mPM");
            mPmField.setAccessible(true);
            mPmField.set(pm, proxy);
        }catch (Exception e){
            Log.d("jw", "hook pms error:"+Log.getStackTraceString(e));
        }
    }
    
    public static void hookPMS(Context context){
    	String qqSign = "308203c7308202afa00302010202046aa5b23d300d06092a864886f70d01010b0500308192310b300906035504061302434e3112301006035504080c09e58c97e4baace5b882310f300d06035504070c06e58c97e4baac31333031060355040a0c2ae58c97e4baace5bda9e4ba91e59ca8e7babfe68a80e69cafe5bc80e58f91e69c89e99990e585ace58fb831183016060355040b130f4d65656c69766520416e64726f6964310f300d060355040313066d6565676f643020170d3135303331393032343933375a180f33303134303732303032343933375a308192310b300906035504061302434e3112301006035504080c09e58c97e4baace5b882310f300d06035504070c06e58c97e4baac31333031060355040a0c2ae58c97e4baace5bda9e4ba91e59ca8e7babfe68a80e69cafe5bc80e58f91e69c89e99990e585ace58fb831183016060355040b130f4d65656c69766520416e64726f6964310f300d060355040313066d6565676f6430820122300d06092a864886f70d01010105000382010f003082010a0282010100afa19f82b0a34cd2a40365dda2d9b6c088fc5eeab199175a268c7f2acc738c37a1dc8f705e17b2581cee7df93053495dd70f176c5865f41f6c6374e7b7d9fb31968694d95b623546f4e3b09b9b186dc282b97ac7d0f63441c9917790af1d26a2eeae4d0fd26ec26d6050c59bd9202080d87417fad819ddf70882c7c04137e3d2a07802de8882ef81e5458f7e7973faacfd19ede809bef680ed51b4f01a08eba4644185278e62c7bcff40e77958b803aa0ea1d2ed7e2294736b0745517188367b467472a1ef121d0ddca934b30a68ce6482b95c424701852dff1487575751cececdda382a4cd702b0a148622eb3f3b30ff9bdfaf53969da991c05307ee6b9d5ad0203010001a321301f301d0603551d0e041604148fdf3566bd514be0ab8057f60c309cf818df94b9300d06092a864886f70d01010b050003820101008bc52464264d39d67979aa39b7a0508670f85116c5510db03bf8a57f0fbcc9f0f80cce8d96a14afc3403f4466e7d37ad08c119873d47a471eaf83d92828879d9d62a1af02e33783f38d1ae1245fee410885c223ff5362f41ce0cd33735e7d70b6b1b9d625d558d1ae3db857c5fec33a62a61b54cebc260726f2db3425cef1217c6667ddd13a99445df9318d287e82b8d588a6805628ea0f131240796cb66d6371866dbf7ba04801e39d42c7d49a00bed479db3164872d0ffc12dec76e6b541e77e2844687cfb11559736825a36fa6d65cc75f6f4d95c75253db92ce7749013def632686b3a572bf0ab299c18c778f3948e22632a5da1e1505fea2d02768fbe9f";
    	hookPMS(context, qqSign, "com.meelive.ingkee", 0);
    	Log.i("jw", "hook succ");
    }
    
}
