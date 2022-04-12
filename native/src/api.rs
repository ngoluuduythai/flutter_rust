
use anyhow::Result;
use std::{thread::sleep, time::Duration};

use flutter_rust_bridge::StreamSink;
use onvif::discovery;

use futures_util::stream::StreamExt;

// This is the entry point of your Rust library.
// When adding new code to your project, note that only items used
// here will be transformed to their Dart equivalents.

// A plain enum without any fields. This is similar to Dart- or C-style enums.
// flutter_rust_bridge is capable of generating code for enums with fields
// (@freezed classes in Dart and tagged unions in C).
pub enum Platform {
    Unknown,
    Android,
    Ios,
    Windows,
    Unix,
    MacIntel,
    MacApple,
    Wasm,
}

// A function definition in Rust. Similar to Dart, the return type must always be named
// and is never inferred.
pub fn platform() -> Platform {
    // This is a macro, a special expression that expands into code. In Rust, all macros
    // end with an exclamation mark and can be invoked with all kinds of brackets (parentheses,
    // brackets and curly braces). However, certain conventions exist, for example the
    // vector macro is almost always invoked as vec![..].
    //
    // The cfg!() macro returns a boolean value based on the current compiler configuration.
    // When attached to expressions (#[cfg(..)] form), they show or hide the expression at compile time.
    // Here, however, they evaluate to runtime values, which may or may not be optimized out
    // by the compiler. A variety of configurations are demonstrated here which cover most of
    // the modern oeprating systems. Try running the Flutter application on different machines
    // and see if it matches your expected OS.
    //
    // Furthermore, in Rust, the last expression in a function is the return value and does
    // not have the trailing semicolon. This entire if-else chain forms a single expression.
    if cfg!(windows) {
        Platform::Windows
    } else if cfg!(target_os = "android") {
        Platform::Android
    } else if cfg!(target_os = "ios") {
        Platform::Ios
    } else if cfg!(target_arch = "aarch64-apple-darwin") {
        Platform::MacApple
    } else if cfg!(target_os = "macos") {
        Platform::MacIntel
    } else if cfg!(target_family = "wasm") {
        Platform::Wasm
    } else if cfg!(unix) {
        Platform::Unix
    } else {
        Platform::Unknown
    }
}

// The convention for Rust identifiers is the snake_case,
// and they are automatically converted to camelCase on the Dart side.
pub fn rust_release_mode() -> bool {
    cfg!(not(debug_assertions))
}



pub struct OnvifDevice {
    pub name: Option<String>,
    pub url_string: String,
}

pub fn scan(sink: StreamSink<OnvifDevice>, timeout_in_seconds: u64) -> Result<()> {

    const MAX_CONCURRENT_JUMPERS: usize = 100;

   let devices = tokio::runtime::Runtime::new()
    .unwrap()
    .block_on( async{
        discovery::discover(std::time::Duration::from_secs(timeout_in_seconds))
        .await
        .unwrap()
        .for_each_concurrent(MAX_CONCURRENT_JUMPERS, |addr| async move {

            let device = OnvifDevice { name: addr.name, url_string: addr.url.to_string() };
            //sink.add(device);
            println!("Device found: {:#?}", device.url_string);
        }).await; 
    });


    sink.add(OnvifDevice{name: Some(String::from("test")), url_string: String::from("test")});
    Ok(())
}

pub fn simple_adder(a: i32, b: i32) -> i32 {
    a + b
}

pub fn query(command: OnvifCommand, args: OnvifCommandArgs) {


}
pub enum OnvifCommand {
    GetSystemDateAndTime,

    GetCapabilities,

    /// Gets the capabilities of all known ONVIF services supported by this device.
    GetServiceCapabilities,

    /// Gets RTSP URIs for all profiles, along with a summary of the video/audio streams.
    GetStreamUris,

    /// Gets JPEG URIs for all profiles
    GetSnapshotUris,

    GetHostname,

    // Gets model, firmware, manufacturer and others informations related to the device.
    GetDeviceInformation,

    // Gets the PTZ status for the primary media profile.
    GetStatus,

    /// Attempts to enable a `vnd.onvif.metadata` RTSP stream with analytics.
    EnableAnalytics,

    /// Gets information about the currently enabled and supported video analytics.
    GetAnalytics,

    // Try to get any possible information
    GetAll,
}


pub struct OnvifCommandArgs {
    pub username: Option<String>,

    pub password: Option<String>,
   
    pub uri: Option<String>,

    pub service_path: String,

    pub cmd: OnvifCommand,
}