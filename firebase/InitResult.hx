package firebase;

/**
 * Haxe extern for the C++ enum firebase::InitResult
 *
 * Reports whether a Firebase module initialized successfully.
 *
 * @:native("firebase::InitResult")
 * @:include("firebase/app.h")
 */
@:native("firebase::InitResult")
@:include("firebase/app.h")
enum  abstract InitResult(Int) {
    /** The given library was successfully initialized. */
    var kInitResultSuccess = 0;
    
    /** * The given library failed to initialize due to a missing dependency.
     */
    var kInitResultFailedMissingDependency = 1;
}