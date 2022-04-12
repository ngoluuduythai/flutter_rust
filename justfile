# Homebrew installs LLVM in a place that is not visible to ffigen.
# This explicitly specifies the place where the LLVM dylibs are kept.
llvm_path := if os() == "macos" {
    "--llvm-path /opt/homebrew/opt/llvm"
} else {
    ""
}

default: gen lint

install_ios:
    cargo install cargo-lipo
    cargo install cbindgen
    rustup target add aarch64-apple-ios	
    rustup target add x86_64-apple-ios
    rustup target add aarch64-apple-ios-sim	

install_window:
    rustup target add x86_64-pc-windows-gnu     # for win32-x86-64-gnu
    rustup target add x86_64-pc-windows-msvc 

install_android:
    cargo install cargo-ndk
    rustup target add \
        aarch64-linux-android \
        armv7-linux-androideabi \
        x86_64-linux-android \
        i686-linux-android
    
install_macos:
    cargo install cargo-lipo
    cargo install cbindgen
    rustup target add x86_64-apple-darwin
    rustup target add aarch64-apple-darwin

gen:
    flutter_rust_bridge_codegen {{llvm_path}} \
        --rust-input native/src/api.rs \
        --dart-output lib/bridge_generated.dart \
        --c-output ios/Runner/bridge_generated.h
    cp ios/Runner/bridge_generated.h macos/Runner/bridge_generated.h
    # Uncomment this line to invoke build_runner as well
    flutter pub run build_runner build

lint:
    cd native && cargo fmt
    dart format .

clean:
    flutter clean
    cd native && cargo clean

# vim:expandtab:sw=4:ts=4
