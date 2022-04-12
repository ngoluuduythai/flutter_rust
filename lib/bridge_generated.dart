// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`.

// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes

import 'dart:convert';
import 'dart:typed_data';

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'dart:ffi' as ffi;

abstract class Native {
  Future<Platform> platform({dynamic hint});

  Future<bool> rustReleaseMode({dynamic hint});

  Stream<OnvifDevice> scan({required int timeoutInSeconds, dynamic hint});

  Future<int> simpleAdder({required int a, required int b, dynamic hint});

  Future<void> query(
      {required OnvifCommand command,
      required OnvifCommandArgs args,
      dynamic hint});
}

enum OnvifCommand {
  GetSystemDateAndTime,
  GetCapabilities,

  /// Gets the capabilities of all known ONVIF services supported by this device.
  GetServiceCapabilities,

  /// Gets RTSP URIs for all profiles, along with a summary of the video/audio streams.
  GetStreamUris,

  /// Gets JPEG URIs for all profiles
  GetSnapshotUris,
  GetHostname,
  GetDeviceInformation,
  GetStatus,

  /// Attempts to enable a `vnd.onvif.metadata` RTSP stream with analytics.
  EnableAnalytics,

  /// Gets information about the currently enabled and supported video analytics.
  GetAnalytics,
  GetAll,
}

class OnvifCommandArgs {
  final String? username;
  final String? password;
  final String? uri;
  final String servicePath;
  final OnvifCommand cmd;

  OnvifCommandArgs({
    this.username,
    this.password,
    this.uri,
    required this.servicePath,
    required this.cmd,
  });
}

class OnvifDevice {
  final String? name;
  final String urlString;

  OnvifDevice({
    this.name,
    required this.urlString,
  });
}

enum Platform {
  Unknown,
  Android,
  Ios,
  Windows,
  Unix,
  MacIntel,
  MacApple,
  Wasm,
}

class NativeImpl extends FlutterRustBridgeBase<NativeWire> implements Native {
  factory NativeImpl(ffi.DynamicLibrary dylib) =>
      NativeImpl.raw(NativeWire(dylib));

  NativeImpl.raw(NativeWire inner) : super(inner);

  Future<Platform> platform({dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_platform(port_),
        parseSuccessData: _wire2api_platform,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "platform",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Future<bool> rustReleaseMode({dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_rust_release_mode(port_),
        parseSuccessData: _wire2api_bool,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "rust_release_mode",
          argNames: [],
        ),
        argValues: [],
        hint: hint,
      ));

  Stream<OnvifDevice> scan({required int timeoutInSeconds, dynamic hint}) =>
      executeStream(FlutterRustBridgeTask(
        callFfi: (port_) =>
            inner.wire_scan(port_, _api2wire_u64(timeoutInSeconds)),
        parseSuccessData: _wire2api_onvif_device,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "scan",
          argNames: ["timeoutInSeconds"],
        ),
        argValues: [timeoutInSeconds],
        hint: hint,
      ));

  Future<int> simpleAdder({required int a, required int b, dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) =>
            inner.wire_simple_adder(port_, _api2wire_i32(a), _api2wire_i32(b)),
        parseSuccessData: _wire2api_i32,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "simple_adder",
          argNames: ["a", "b"],
        ),
        argValues: [a, b],
        hint: hint,
      ));

  Future<void> query(
          {required OnvifCommand command,
          required OnvifCommandArgs args,
          dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_query(
            port_,
            _api2wire_onvif_command(command),
            _api2wire_box_autoadd_onvif_command_args(args)),
        parseSuccessData: _wire2api_unit,
        constMeta: const FlutterRustBridgeTaskConstMeta(
          debugName: "query",
          argNames: ["command", "args"],
        ),
        argValues: [command, args],
        hint: hint,
      ));

  // Section: api2wire
  ffi.Pointer<wire_uint_8_list> _api2wire_String(String raw) {
    return _api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  ffi.Pointer<wire_OnvifCommandArgs> _api2wire_box_autoadd_onvif_command_args(
      OnvifCommandArgs raw) {
    final ptr = inner.new_box_autoadd_onvif_command_args();
    _api_fill_to_wire_onvif_command_args(raw, ptr.ref);
    return ptr;
  }

  int _api2wire_i32(int raw) {
    return raw;
  }

  int _api2wire_onvif_command(OnvifCommand raw) {
    return raw.index;
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_opt_String(String? raw) {
    return raw == null ? ffi.nullptr : _api2wire_String(raw);
  }

  int _api2wire_u64(int raw) {
    return raw;
  }

  int _api2wire_u8(int raw) {
    return raw;
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }

  // Section: api_fill_to_wire

  void _api_fill_to_wire_box_autoadd_onvif_command_args(
      OnvifCommandArgs apiObj, ffi.Pointer<wire_OnvifCommandArgs> wireObj) {
    _api_fill_to_wire_onvif_command_args(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_onvif_command_args(
      OnvifCommandArgs apiObj, wire_OnvifCommandArgs wireObj) {
    wireObj.username = _api2wire_opt_String(apiObj.username);
    wireObj.password = _api2wire_opt_String(apiObj.password);
    wireObj.uri = _api2wire_opt_String(apiObj.uri);
    wireObj.service_path = _api2wire_String(apiObj.servicePath);
    wireObj.cmd = _api2wire_onvif_command(apiObj.cmd);
  }
}

// Section: wire2api
String _wire2api_String(dynamic raw) {
  return raw as String;
}

bool _wire2api_bool(dynamic raw) {
  return raw as bool;
}

int _wire2api_i32(dynamic raw) {
  return raw as int;
}

OnvifDevice _wire2api_onvif_device(dynamic raw) {
  final arr = raw as List<dynamic>;
  if (arr.length != 2)
    throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
  return OnvifDevice(
    name: _wire2api_opt_String(arr[0]),
    urlString: _wire2api_String(arr[1]),
  );
}

String? _wire2api_opt_String(dynamic raw) {
  return raw == null ? null : _wire2api_String(raw);
}

Platform _wire2api_platform(dynamic raw) {
  return Platform.values[raw];
}

int _wire2api_u8(dynamic raw) {
  return raw as int;
}

Uint8List _wire2api_uint_8_list(dynamic raw) {
  return raw as Uint8List;
}

void _wire2api_unit(dynamic raw) {
  return;
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class NativeWire implements FlutterRustBridgeWireBase {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  NativeWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  NativeWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void wire_platform(
    int port_,
  ) {
    return _wire_platform(
      port_,
    );
  }

  late final _wire_platformPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_platform');
  late final _wire_platform =
      _wire_platformPtr.asFunction<void Function(int)>();

  void wire_rust_release_mode(
    int port_,
  ) {
    return _wire_rust_release_mode(
      port_,
    );
  }

  late final _wire_rust_release_modePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_rust_release_mode');
  late final _wire_rust_release_mode =
      _wire_rust_release_modePtr.asFunction<void Function(int)>();

  void wire_scan(
    int port_,
    int timeout_in_seconds,
  ) {
    return _wire_scan(
      port_,
      timeout_in_seconds,
    );
  }

  late final _wire_scanPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Uint64)>>(
          'wire_scan');
  late final _wire_scan = _wire_scanPtr.asFunction<void Function(int, int)>();

  void wire_simple_adder(
    int port_,
    int a,
    int b,
  ) {
    return _wire_simple_adder(
      port_,
      a,
      b,
    );
  }

  late final _wire_simple_adderPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Int32, ffi.Int32)>>('wire_simple_adder');
  late final _wire_simple_adder =
      _wire_simple_adderPtr.asFunction<void Function(int, int, int)>();

  void wire_query(
    int port_,
    int command,
    ffi.Pointer<wire_OnvifCommandArgs> args,
  ) {
    return _wire_query(
      port_,
      command,
      args,
    );
  }

  late final _wire_queryPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Int32,
              ffi.Pointer<wire_OnvifCommandArgs>)>>('wire_query');
  late final _wire_query = _wire_queryPtr.asFunction<
      void Function(int, int, ffi.Pointer<wire_OnvifCommandArgs>)>();

  ffi.Pointer<wire_OnvifCommandArgs> new_box_autoadd_onvif_command_args() {
    return _new_box_autoadd_onvif_command_args();
  }

  late final _new_box_autoadd_onvif_command_argsPtr = _lookup<
          ffi.NativeFunction<ffi.Pointer<wire_OnvifCommandArgs> Function()>>(
      'new_box_autoadd_onvif_command_args');
  late final _new_box_autoadd_onvif_command_args =
      _new_box_autoadd_onvif_command_argsPtr
          .asFunction<ffi.Pointer<wire_OnvifCommandArgs> Function()>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list(
    int len,
  ) {
    return _new_uint_8_list(
      len,
    );
  }

  late final _new_uint_8_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list');
  late final _new_uint_8_list = _new_uint_8_listPtr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturnStruct(
    WireSyncReturnStruct val,
  ) {
    return _free_WireSyncReturnStruct(
      val,
    );
  }

  late final _free_WireSyncReturnStructPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturnStruct)>>(
          'free_WireSyncReturnStruct');
  late final _free_WireSyncReturnStruct = _free_WireSyncReturnStructPtr
      .asFunction<void Function(WireSyncReturnStruct)>();

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();
}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

class wire_OnvifCommandArgs extends ffi.Struct {
  external ffi.Pointer<wire_uint_8_list> username;

  external ffi.Pointer<wire_uint_8_list> password;

  external ffi.Pointer<wire_uint_8_list> uri;

  external ffi.Pointer<wire_uint_8_list> service_path;

  @ffi.Int32()
  external int cmd;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Uint8 Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
