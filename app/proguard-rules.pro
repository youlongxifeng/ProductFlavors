# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile
#避免混淆Android基本组件，下面是兼容性比较高的规则：
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class com.android.vending.licensing.ILicensingService

#不提示V4包下错误警告
-dontwarn android.support.v4.**
#保持下面的V4兼容包的类不被混淆
-keep class android.support.v4.**{*;}

#避免混淆所有native的方法,涉及到C、C++
-keepclasseswithmembernames class * {
        native <methods>;
}
#避免混淆自定义控件类的get/set方法和构造函数
-keep public class * extends android.view.View{
        *** get*();
        void set*(***);
        public <init>(android.content.Context);
        public <init>(android.content.Context,android.util.AttributeSet);
        public <init>(android.content.Context,android.util.AttributeSet,int);
    }
    #避免混淆枚举类
    -keepclassmembers enum * {
        public static **[] values();
        public static ** valueOf(java.lang.String);
    }
    #避免混淆序列化类
    #不混淆Parcelable和它的实现子类，还有Creator成员变量
    -keep class * implements android.os.Parcelable {
      public static final android.os.Parcelable$Creator *;
    }

    #不混淆Serializable和它的实现子类、其成员变量
    -keepclassmembers class * implements java.io.Serializable {
        static final long serialVersionUID;
        private static final java.io.ObjectStreamField[] serialPersistentFields;
        private void writeObject(java.io.ObjectOutputStream);
        private void readObject(java.io.ObjectInputStream);
        java.lang.Object writeReplace();
        java.lang.Object readResolve();
    }
    #避免混淆JSON类的构造函数
    #使用GSON、fastjson等框架时，所写的JSON对象类不混淆，否则无法将JSON解析成对应的对象
        -keepclassmembers class * {
            public <init>(org.json.JSONObject);
        }

    #避免混淆属性动画兼容库
        -dontwarn com.nineoldandroids.*
        -keep class com.nineoldandroids.** { *;}

        #不混淆泛型
        -keepattributes Signature

        #避免混淆注解类
        -dontwarn android.annotation
        -keepattributes *Annotation*

        #避免混淆内部类
        -keepattributes InnerClasses

        #避免混淆实体类，修改成你对应的包名
        -keep class com.wyk.test.bean.** { *; }
        -keep class com.wyk.test.event.** { *; }
        -keep public class com.wyk.test.utils.eventbus.** { *;}

        #避免混淆Rxjava/RxAndroid
        -dontwarn sun.misc.**
        -keepclassmembers class rx.internal.util.unsafe.*ArrayQueue*Field* {
         long producerIndex;
         long consumerIndex;
        }
        -keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueProducerNodeRef {
         rx.internal.util.atomic.LinkedQueueNode producerNode;
        }
        -keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueConsumerNodeRef {
         rx.internal.util.atomic.LinkedQueueNode consumerNode;
        }

    #避免混淆js相关的接口
    -keepattributes *JavascriptInterface*
    -keep class com.wyk.test.js.** { *; }

    # 设置混淆的压缩比率 0 ~ 7
    -optimizationpasses 5
    # 混淆后类名都为小写   Aa aA
    -dontusemixedcaseclassnames
    # 指定不去忽略非公共库的类
    -dontskipnonpubliclibraryclasses
    #不做预校验的操作
    -dontpreverify
    # 混淆时不记录日志
    -verbose
    # 混淆采用的算法.
    -optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
    #保留代码行号，方便异常信息的追踪
    -keepattributes SourceFile,LineNumberTable

    #dump文件列出apk包内所有class的内部结构
    -dump class_files.txt
    #seeds.txt文件列出未混淆的类和成员
    -printseeds seeds.txt
    #usage.txt文件列出从apk中删除的代码
    -printusage unused.txt
    #mapping文件列出混淆前后的映射
    -printmapping mapping.txt
