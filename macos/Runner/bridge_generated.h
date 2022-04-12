#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct wire_OnvifCommandArgs {
  struct wire_uint_8_list *username;
  struct wire_uint_8_list *password;
  struct wire_uint_8_list *uri;
  struct wire_uint_8_list *service_path;
  int32_t cmd;
} wire_OnvifCommandArgs;

typedef struct WireSyncReturnStruct {
  uint8_t *ptr;
  int32_t len;
  bool success;
} WireSyncReturnStruct;

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

void wire_platform(int64_t port_);

void wire_rust_release_mode(int64_t port_);

void wire_scan(int64_t port_, uint64_t timeout_in_seconds);

void wire_simple_adder(int64_t port_, int32_t a, int32_t b);

void wire_query(int64_t port_, int32_t command, struct wire_OnvifCommandArgs *args);

struct wire_OnvifCommandArgs *new_box_autoadd_onvif_command_args(void);

struct wire_uint_8_list *new_uint_8_list(int32_t len);

void free_WireSyncReturnStruct(struct WireSyncReturnStruct val);

void store_dart_post_cobject(DartPostCObjectFnType ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_platform);
    dummy_var ^= ((int64_t) (void*) wire_rust_release_mode);
    dummy_var ^= ((int64_t) (void*) wire_scan);
    dummy_var ^= ((int64_t) (void*) wire_simple_adder);
    dummy_var ^= ((int64_t) (void*) wire_query);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_onvif_command_args);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturnStruct);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}