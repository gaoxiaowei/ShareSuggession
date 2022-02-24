//
//  AppDelegate.m
//  ShareSuggession
//
//  Created by gaoxiaowei on 2022/2/23.
//

#import "AppDelegate.h"
#import <Intents/Intents.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self addShortCut];
    [self addShortCut2];
    return YES;
}

-(void)addShortCut{
    INSpeakableString*groupName =[[INSpeakableString alloc]initWithSpokenPhrase:@"gaoxiaowei"];
    
    INPersonHandle*personHandle =[[INPersonHandle alloc]initWithValue:@"gaoxiaowei" type:INPersonHandleTypeEmailAddress];
    
    INImage*image =[INImage imageWithURL:[NSURL URLWithString:@"https://p3.qhimg.com/dr/104_104_/t01f5928f13aba990a1.jpg"]];
//    INImage *image =[INImage imageNamed:@"user_about_logo"];
    INPerson*person =[[INPerson alloc]initWithPersonHandle:personHandle nameComponents:nil  displayName:@"gaoxiaowei" image:image contactIdentifier:@"gaoxiaowei" customIdentifier:@"gaoxiaowei"];
    INSendMessageIntent * sendMessageIntent =[[INSendMessageIntent alloc]initWithRecipients:@[person] content:nil speakableGroupName:groupName conversationIdentifier:@"sampleConversationIdentifier" serviceName:nil sender:nil];

    if (@available(iOS 12.0, *)) {
        [sendMessageIntent setImage:image forParameterNamed:@"speakableGroupName"];
    } else {
        // Fallback on earlier versions
    }
    
    INInteraction*interaction =[[INInteraction alloc]initWithIntent:sendMessageIntent response:nil];
    [interaction donateInteractionWithCompletion:^(NSError * _Nullable error) {
            
    }];

}
-(void)addShortCut2{
    INSpeakableString*groupName =[[INSpeakableString alloc]initWithSpokenPhrase:@"wangshuailong"];
    
    INPersonHandle*personHandle =[[INPersonHandle alloc]initWithValue:@"wangshuailong" type:INPersonHandleTypeEmailAddress];
    
    INImage*image =[INImage imageWithURL:[NSURL URLWithString:@"https://p2.qhimg.com/dr/0_0_100/t01e8c27e5465d245a4.png"]];
//    INImage *image =[INImage imageNamed:@"user_about_logo"];
    INPerson*person =[[INPerson alloc]initWithPersonHandle:personHandle nameComponents:nil  displayName:@"gaoxiaowei" image:image contactIdentifier:@"gaoxiaowei" customIdentifier:@"gaoxiaowei"];
    
    INSendMessageIntent * sendMessageIntent =[[INSendMessageIntent alloc]initWithRecipients:@[person] content:nil speakableGroupName:groupName conversationIdentifier:@"sampleConversationIdentifier2" serviceName:nil sender:nil];
    if (@available(iOS 12.0, *)) {
        [sendMessageIntent setImage:image forParameterNamed:@"speakableGroupName"];
    } else {
        // Fallback on earlier versions
    }
    
    INInteraction*interaction =[[INInteraction alloc]initWithIntent:sendMessageIntent response:nil];
    [interaction donateInteractionWithCompletion:^(NSError * _Nullable error) {
            
    }];

}
#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
