package firebase;

import cpp.Pointer;

/**
 * Options that control the creation of a Firebase App.
 *
 * Maps to the C++ class `firebase::AppOptions`.
 */
@:native("firebase::AppOptions")
@:include("firebase/app.h")
@:keep
extern class AppOptions {
    /**
     * Create AppOptions.
     */
    public function new();

    /**
     * Set the Firebase app ID (mobilesdk_app_id or GOOGLE_APP_ID).
     */
    @:native("set_app_id")
    public function set_app_id(id:String):Void;

    /**
     * Retrieves the app ID.
     */
    @:native("app_id")
    public function app_id():String;

    /**
     * API key used to authenticate requests from your app.
     */
    @:native("set_api_key")
    public function set_api_key(key:String):Void;

    /**
     * Get the API key.
     */
    @:native("api_key")
    public function api_key():String;

    /**
     * Set the Firebase Cloud Messaging sender ID.
     */
    @:native("set_messaging_sender_id")
    public function set_messaging_sender_id(sender_id:String):Void;

    /**
     * Get the Firebase Cloud Messaging sender ID.
     */
    @:native("messaging_sender_id")
    public function messaging_sender_id():String;

    /**
     * Set the database root URL.
     */
    @:native("set_database_url")
    public function set_database_url(url:String):Void;

    /**
     * Get database root URL.
     */
    @:native("database_url")
    public function database_url():String;

    /**
     * Set the tracking ID for Google Analytics.
     */
    @:native("set_ga_tracking_id")
    public function set_ga_tracking_id(id:String):Void;

    /**
     * Get the tracking ID for Google Analytics.
     */
    @:native("ga_tracking_id")
    public function ga_tracking_id():String;

    /**
     * Set the Google Cloud Storage bucket name.
     */
    @:native("set_storage_bucket")
    public function set_storage_bucket(bucket:String):Void;

    /**
     * Get the Google Cloud Storage bucket name.
     */
    @:native("storage_bucket")
    public function storage_bucket():String;

    /**
     * Set the Google Cloud project ID.
     */
    @:native("set_project_id")
    public function set_project_id(project:String):Void;

    /**
     * Get the Google Cloud project ID.
     */
    @:native("project_id")
    public function project_id():String;

    /**
     * Set the iOS client ID (clientID in GoogleService-Info.plist).
     */
    @:native("set_client_id")
    public function set_client_id(client_id:String):Void;

    /**
     * Get the iOS client ID.
     */
    @:native("client_id")
    public function client_id():String;

    /**
     * Set the Android package name or iOS bundle ID.
     */
    @:native("set_package_name")
    public function set_package_name(package_name:String):Void;

    /**
     * Get the Android package name or iOS bundle ID.
     */
    @:native("package_name")
    public function package_name():String;

    /**
     * Load options from a JSON config string.
     * @param config A JSON string (e.g., contents of google-services.json).
     * @param options Optional: An existing AppOptions instance to populate.
     * @return A pointer to the populated AppOptions instance.
     */
    @:native("firebase::AppOptions::LoadFromJsonConfig")
    public static function loadFromJsonConfig(config:String, ?options:Pointer<AppOptions>):Pointer<AppOptions>;

    #if android
    /**
     * (Android) Load default options from Android resources.
     * @param options Optional: An existing AppOptions instance to populate.
     * @param jni_env JNI environment.
     * @param activity JNI reference to the Android activity.
     * @return A pointer to the populated AppOptions instance.
     */
    @:native("firebase::AppOptions::LoadDefault")
    public static function loadDefault(?options:Pointer<AppOptions>, jni_env:Dynamic, activity:Dynamic):Pointer<AppOptions>;

    /**
     * (Android) Attempt to populate required options with default values.
     * @return true if successful, false otherwise.
     */
    @:native("PopulateRequiredWithDefaults")
    public function populateRequiredWithDefaults(jni_env:Dynamic, activity:Dynamic):Bool;
    #else
    /**
     * (Non-Android) Load default options from resource files (e.g., GoogleService-Info.plist).
     * @param options Optional: An existing AppOptions instance to populate.
     * @return A pointer to the populated AppOptions instance.
     */
    @:native("firebase::AppOptions::LoadDefault")
    public static function loadDefault(?options:Pointer<AppOptions>):Pointer<AppOptions>;

    /**
     * (Non-Android) Attempt to populate required options with default values.
     * @return true if successful, false otherwise.
     */
    @:native("PopulateRequiredWithDefaults")
    public function populateRequiredWithDefaults():Bool;
    #end
}