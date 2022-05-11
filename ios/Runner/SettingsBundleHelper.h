//
//  SettingsBundleHelper.h
//  Runner
//
//  Created by Sunwoo Park on 2022-05-11.
//

#import <Foundation/Foundation.h>

#define SETTINGS_BUNDLE_KEYS_RESET @"RESET_APP_KEY"
#define SETTINGS_BUNDLE_KEYS_BUILD_VERSION_KEY @"build_preference"
#define SETTINGS_BUNDLE_KEYS_APP_VERSION_KEY @"version_preference"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsBundleHelper : NSObject

+ (void)checkAndExecuteSettings;
+ (void)setVersionAndBuildNumber;

@end

NS_ASSUME_NONNULL_END
