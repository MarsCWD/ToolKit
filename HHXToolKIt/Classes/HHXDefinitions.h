//
//  HHXDefinitions.h
//  HHXBaseKit
//
//  Created by 陈卫东 on 2016/12/30.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#ifndef HHXDefinitions_h
#define HHXDefinitions_h

//netWork
#define hasNetWork ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus > 0)

//Log
#ifdef DEBUG
#define HHXLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define HHXLog(format, ...)
#endif

//Image
#define kImgName(name) [UIImage imageNamed:name]

#define kResourcePath(name, type) ([[NSBundle mainBundle] pathForResource:name ofType:type])
#define kImgFromFile(name, type) [[UIImage alloc] initWithContentsOfFile:kResourcePath(name, type)]


//Frame
#define ScreenWidth         [UIScreen mainScreen].bounds.size.width
#define ScreenHeight        [UIScreen mainScreen].bounds.size.height
#define ScreenScale         [UIScreen mainScreen].scale
#define ScreenRatio         ScreenWidth / 375.0
#define NavBarHeight        self.navigationController.navigationBar.bounds.size.height
#define StatusBarHeight     20
#define TabBarHeight        self.tabBarController.tabBar.bounds.size.height
#define ViewBounds          CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - StatusBarHeight - NavBarHeight - TabBarHeight)

#define kRatio(number)      number * ScreenRatio

//Color
#define RGB(R, G, B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define RGBA(R, G, B, A)    [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define HEXColor(c)         [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]
#define HHXViewBorderRadius(View, Radius, Width, Color)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#define Nav_BG_Color        HEXColor(0x00AFEC)
#define App_BG_Color        HEXColor(0xEEEEEE)
#define App_Line_Color      HEXColor(0xDFDFDE)
#define Import_Text_Color   HEXColor(0x333333)
#define Normal_Text_Color   HEXColor(0x999899)
#define Hlight_Text_Color   HEXColor(0xF0F0F0)
#define OnePixelLineWidth   1.0 / ScreenScale

//system Version
#define iOS(version)        [[[UIDevice currentDevice] systemVersion] floatValue] >= version

//App info
#define AppVersion          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define AppName             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]

//others
#define Format(string, args...)     [NSString stringWithFormat:string, args]
#define UserDefaults                [NSUserDefaults standardUserDefaults]
#define Font(font)                  [UIFont systemFontOfSize:font]
#define BoldFont(font)              [UIFont boldSystemFontOfSize:font]

//dispatch
#ifndef dispatch_main_sync_safe
#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}
#endif

#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
#endif

//weak strong
#define HHXWeakSelf(type)       __weak typeof(type) weak##type = type;
#define HHXStrongSelf(type)     __strong typeof(type) type = weak##type;

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000  // 当前Xcode支持iOS8及以上
#else
#endif


#endif /* HHXDefinitions_h */
