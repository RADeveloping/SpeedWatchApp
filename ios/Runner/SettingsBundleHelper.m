//
//  SettingsBundleHelper.m
//  Runner
//
//  Created by Sunwoo Park on 2022-05-11.
//

#import "SettingsBundleHelper.h"

@implementation SettingsBundleHelper

+ (void)checkAndExecuteSettings {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:SETTINGS_BUNDLE_KEYS_RESET]) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:SETTINGS_BUNDLE_KEYS_RESET];
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
        NSString *applicationSupportDirectory = [paths firstObject];
        
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSArray *fileArray = [fileMgr contentsOfDirectoryAtPath:applicationSupportDirectory error:nil];
        for (NSString *filename in fileArray)  {

            [fileMgr removeItemAtPath:[applicationSupportDirectory stringByAppendingPathComponent:filename] error:NULL];
        }
    }
}

+ (void)setVersionAndBuildNumber {
    NSString *version = (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setObject:version forKey:SETTINGS_BUNDLE_KEYS_APP_VERSION_KEY];
    NSString *build = (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    [[NSUserDefaults standardUserDefaults] setObject:build forKey:SETTINGS_BUNDLE_KEYS_BUILD_VERSION_KEY];
}

@end
