package firebase;

import cpp.ConstCharStar;
import cpp.Pointer;
import cpp.StdString;
import cpp.Star;
import firebase.AppOptions;
import firebase.InitResult;
import haxe.ds.Vector;
import haxe.ds.Map;

/**
 * Haxe extern for C++ class firebase::App
 *
 * Firebase application object.
 *
 * An instance of this extern class maps to a `firebase::App*` in C++.
 *
 * @:native("firebase::App")
 * @:include("firebase/app.h")
 */
@:keep
@:native("firebase::App*")
@:include("firebase/app.h")
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('firebase'))
#end

extern class App {

    // --- Static Create Methods (Using non-Android versions) ---

    #if !android
    /**
     * Initializes the default firebase::App with default options.
     * C++: static App* Create();
     */
    @:native("firebase::App::Create")
    public static function Create():App;

    /**
     * Initializes the default firebase::App with the given options.
     * C++: static App* Create(const AppOptions& options);
     */
    @:native("firebase::App::Create")
    public static function CreateWithOptions(options:AppOptions):App;

    /**
     * Initializes a firebase::App with the given options that operates on the named app.
     * C++: static App* Create(const AppOptions& options, const char* name);
     */
    @:native("firebase::App::Create")
    public static function CreateWithOptionsAndName(options:AppOptions, name:ConstCharStar):App;
    #else
        /**
     * (Android) Initializes the default firebase::App with default options.
     * @param jni_env JNI environment.
     * @param activity JNI reference to the Android activity.
     * @return New App instance, or null if default options can't be loaded.
     */
    @:native("firebase::App::Create")
    public static function Create(jni_env:Dynamic, activity:Dynamic):App;

    /**
     * (Android) Initializes the default firebase::App with the given options.
     * @param options Options that control the creation of the App.
     * @param jni_env JNI environment.
     * @param activity JNI reference to the Android activity.
     * @return New App instance.
     */
    @:native("firebase::App::Create")
    public static function CreateWithOptions(options:AppOptions, jni_env:Dynamic, activity:Dynamic):App;

    /**
     * (Android) Initializes a named firebase::App with the given options.
     * @param options Options that control the creation of the App.
     * @param name Name of this App instance.
     * @param jni_env JNI environment.
     * @param activity JNI reference to the Android activity.
     * @return New App instance.
     */
    @:native("firebase::App::Create")
    public static function CreateWithOptionsAndName(options:AppOptions, name:String, jni_env:Dynamic, activity:Dynamic):App;
    #end

    // --- Static GetInstance Methods ---

    /**
     * Get the default App, or nullptr if none has been created.
     * C++: static App* GetInstance();
     */
    @:native("firebase::App::GetInstance")
    public static function GetInstance():App;

    /**
     * Get the App with the given name, or nullptr if none have been created.
     * C++: static App* GetInstance(const char* name);
     */
    @:native("firebase::App::GetInstance")
    public static function GetInstanceByName(name:ConstCharStar):App;

    /**
     * Get all created App instances.
     * Maps to std::vector<App*>.
     */
    @:native("firebase::App::GetApps")
    public static function getApps():Vector<App>;

    #if android
    /**
     * (Android) Get Java virtual machine.
     * @return The JavaVM* pointer.
     */
    @:native("java_vm")
    public function java_vm():Dynamic; // JavaVM*

    /**
     * (Android) Get JNI environment for the current thread.
     * @return The JNIEnv* pointer.
     */
    @:native("GetJNIEnv")
    public function getJNIEnv():Dynamic; // JNIEnv*

    /**
     * (Android) Get a global reference to the Android activity.
     * @return The jobject for the activity.
     */
    public function activity():Dynamic; // jobject
    #end

    /**
     * Get the name of this App instance.
     * C++: const char* name() const;
     */
    @:native("name")
    public function name():ConstCharStar;

    /**
     * Get options the App was created with.
     * C++: const AppOptions& options() const;
     *
     * (hxcpp will handle the `const&` return by making a copy)
     */
    @:native("options")
    public function options():AppOptions;

    /**
     * Sets whether automatic data collection is enabled for all products.
     * C++: void SetDataCollectionDefaultEnabled(bool enabled);
     */
    @:native("SetDataCollectionDefaultEnabled")
    public function SetDataCollectionDefaultEnabled(enabled:Bool):Void;

    /**
     * Gets whether automatic data collection is enabled for all products.
     * C++: bool IsDataCollectionDefaultEnabled() const;
     */
    @:native("IsDataCollectionDefaultEnabled")
    public function IsDataCollectionDefaultEnabled():Bool;

    // --- Internal/Static Setup Methods ---
    
    /**
     * Get the initialization results of modules.
     * C++: const std::map<std::string, InitResult>& init_results() const;
     *
     * (Returns a pointer to the map, `Star<Map<...>>`, to handle const&)
     */
    @:native("init_results")
    public function init_results():Star<Map<StdString, InitResult>>;

    /**
     * Register a library which utilizes the Firebase C++ SDK.
     * C++: static void RegisterLibrary(const char* library, const char* version, void* platform_resource);
     */
    @:native("firebase::App::RegisterLibrary")
    public static function RegisterLibrary(library:ConstCharStar, version:ConstCharStar, platform_resource:Pointer<Void>):Void;
    
    /**
     * Internal method to retrieve the combined string of registered libraries.
     * C++: static const char* GetUserAgent();
     */
    @:native("firebase::App::GetUserAgent")
    public static function GetUserAgent():ConstCharStar;

    /**
     * (Desktop) Sets the path to search for 'google-services-desktop.json'.
     */
    @:native("firebase::App::SetDefaultConfigPath")
    public static function setDefaultConfigPath(path:String):Void;

    #if android
    /**
     * (Android) Get the underlying platform-specific app object.
     * @return Global reference to the com.google.firebase.FirebaseApp jobject.
     */
    @:native("GetPlatformApp")
    public function getPlatformApp():Dynamic; // jobject
    #elseif (ios || tvos)
    /**
     * (iOS/tvOS) Get the underlying platform-specific app object.
     * @return Reference to the FIRApp object.
     */
    @:native("GetPlatformApp")
    public function getPlatformApp():Dynamic; // FIRApp*
    #end
}