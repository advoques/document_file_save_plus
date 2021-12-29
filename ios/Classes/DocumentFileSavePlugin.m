#import "DocumentFileSavePlugin.h"
#if __has_include(<document_file_save/document_file_save-Swift.h>)
#import <document_file_save/document_file_save-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "document_file_save-Swift.h"
#endif

@implementation DocumentFileSavePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDocumentFileSavePlugin registerWithRegistrar:registrar];
}
@end
