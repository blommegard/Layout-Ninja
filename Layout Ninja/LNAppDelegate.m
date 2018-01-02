//
//  LNAppDelegate.m
//  Layout Ninja
//
//  Created by Simon Blommegård on 2014-06-09.
//  Copyright (c) 2014 Simon Blommegård. All rights reserved.
//

#import "LNAppDelegate.h"

@interface LNAppDelegate ()
@property (strong) NSTextInputContext *context;
@end

@implementation LNAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  self.context = [NSTextInputContext new];
  [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self selector:@selector(activateApp:) name:NSWorkspaceDidActivateApplicationNotification object:nil];
}

- (void)activateApp:(NSNotification *)notification {
  NSString *defaultInputSource = @"com.apple.keylayout.Swedish-Pro";
  NSString *devInputSource = @"com.apple.keylayout.US";

  NSArray *devApps = @[
                       @"com.apple.dt.Xcode",
                       @"org.vim.MacVim"
                       ];
  
  NSRunningApplication *app = notification.userInfo[NSWorkspaceApplicationKey];
  NSString *inputSource = [devApps containsObject:app.bundleIdentifier] ? devInputSource : defaultInputSource;
  
  [self.context setSelectedKeyboardInputSource:inputSource];
}

@end
