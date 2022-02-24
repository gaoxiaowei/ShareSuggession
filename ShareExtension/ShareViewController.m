//
//  ShareViewController.m
//  shareExtension
//
//  Created by gaoxiaowei on 2022/2/23.
//

#import "ShareViewController.h"
#import <Intents/Intents.h>
#import <UIKit/UIKit.h>


@interface ShareViewController ()
@property(nonatomic,strong)INPerson*person;
@end

@implementation ShareViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    // Populate the recipient property with the metadata in case the user tapped a suggestion from the share sheet.
    INSendMessageIntent*indent =(INSendMessageIntent*)self.extensionContext.intent;
    NSString*conversationIdentifier =indent.conversationIdentifier;
    NSArray<INPerson *> *recipients =indent.recipients;
    self.person =recipients.firstObject;
   
}
- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    [self.extensionContext completeRequestReturningItems:self.extensionContext.inputItems completionHandler:nil];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
//    SLComposeSheetConfigurationItem *item = [SLComposeSheetConfigurationItem new];
//    item.title =@"The To: label when sharing content.";
//    item.value =@"";
//    __weak __typeof(self) weakSelf = self;
//    __weak __typeof(SLComposeSheetConfigurationItem*) weakItem = item;
//    item.tapHandler = ^{
//        [weakSelf validateContent];
//        weakItem.value=self.person.displayName;
//    };
//    return @[item];
}
@end
