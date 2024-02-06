//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <contextual_menu/contextual_menu_plugin.h>
#include <local_notifier/local_notifier_plugin.h>
#include <protocol_handler_windows/protocol_handler_windows_plugin_c_api.h>
#include <proxy_manager/proxy_manager_plugin.h>
#include <screen_retriever/screen_retriever_plugin.h>
#include <shortcut_menu_extender_windows/shortcut_menu_extender_windows_plugin_c_api.h>
#include <system_tray/system_tray_plugin.h>
#include <url_launcher_windows/url_launcher_windows.h>
#include <window_manager/window_manager_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  ContextualMenuPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ContextualMenuPlugin"));
  LocalNotifierPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("LocalNotifierPlugin"));
  ProtocolHandlerWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ProtocolHandlerWindowsPluginCApi"));
  ProxyManagerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ProxyManagerPlugin"));
  ScreenRetrieverPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenRetrieverPlugin"));
  ShortcutMenuExtenderWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ShortcutMenuExtenderWindowsPluginCApi"));
  SystemTrayPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SystemTrayPlugin"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
  WindowManagerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WindowManagerPlugin"));
}
