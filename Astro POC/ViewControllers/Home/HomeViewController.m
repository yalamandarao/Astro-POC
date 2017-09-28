//
//  HomeViewController.m
//  Astro POC
//
//  Created by yalamanda inaganti on 9/25/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "HomeViewController.h"
#import <PromiseKit/PromiseKit.h>
#import "GetChannelListService.h"
#import "IGetChannelListService.h"
#import "ChannelTableViewCell.h"
#import "IChannelListStorage.h"
#import <MRProgress/MRProgress.h>
#import "FacebookLoginView.h"
#import "KLCPopup.h"
#import "FCAlertView.h"
#import "ErrorHelper.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "ISelectedItemsStorage.h"
#import "SelectedItemsStorage.h"
#import "Favourite.h"


@interface HomeViewController ()
{
    NSMutableArray *channelArray;
    NSString *facebookLoginId;
}
@property (nonatomic, strong) IBOutlet UITableView *channelTableView;
@property (nonatomic, strong) FacebookLoginView *facebookLoginView;
@property (nonatomic, strong) KLCPopup* popup;
@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self navigationBarLogoutButton];
    [self setupUI];
    [self getChannelList];
    // Do any additional setup after loading the view.
}

#pragma mark - Setup UI
- (void) setupUI
{
    UIImage *image = [UIImage imageNamed:@"nav-logo.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    [imageView setImage:image];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imageView;
    channelArray = [[NSMutableArray alloc] init];
    _channelTableView.tableFooterView = [UIView new];
    
}

#pragma mark - Get Channel List

 - (void) getChannelList
{
  [MRProgressOverlayView showOverlayAddedTo:self.view title:@"Loading ..." mode:MRProgressOverlayViewModeIndeterminateSmall animated:YES];
    [_getChannelListService getChannelListData]
    .then(^{
        [_selectedItemsStorage getFavouriteHistory]
        .then(^(NSMutableArray *selectedArray){
            NSLog(@"Selected itemms %@",selectedArray);
            [_channelListStorage getChannelHistory:selectedArray]
      .then(^(NSMutableArray *resultArray){
        channelArray = [[NSMutableArray alloc] initWithArray:resultArray];
        [_channelTableView reloadData];
        NSLog(@"Final Result %lu",(unsigned long)channelArray.count);
        [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];
      });
        });
    })
    .catch(^(NSError *error){
        [self _displayError: error];
    });
}

#pragma mark Display error message
- (void) _displayError: (NSError*) error
{
    NSString* message = @"";
    
    if (error.code == ZSNoDataError)
    {
        message = error.userInfo[@"Message"];
    }
    else if(error.code == ZSErrorDomainError)
    {
        message = @"Please check the internet connection";
    }
    else if (error.code == ZSLoginInternetConnectionError)
    {
        message = @"Internet issue";
    }
    else if (error.code == ZSServerkError || error.code == 500)
    {
        message = @"Internal server error";
    }
    else if (error.userInfo != nil)
    {
        message = error.userInfo[@"Message"];
    }
    
    FCAlertView *alert = [[FCAlertView alloc] init];
    [alert makeAlertTypeWarning];
    alert.animateAlertInFromTop = YES;
    [alert showAlertInView:self
                 withTitle:message
              withSubtitle:nil
           withCustomImage:nil
       withDoneButtonTitle:nil
                andButtons:nil];
}

#pragma mark TableView delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return channelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ChannelTableViewCellID";
    ChannelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.channelList = channelArray[indexPath.row];
    cell.favoriteButton.tag = indexPath.row;
    [cell.favoriteButton addTarget:self action:@selector(favoriteButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - FavoriteButtonTap

- (void)favoriteButtonTap:(UIButton *)sender
{
    if ([FBSDKAccessToken currentAccessToken]) {
        [self navigationBarLogoutButton];
        ChannelList *channelList = [channelArray objectAtIndex:sender.tag];
        ChannelList *newChannelList = [ChannelList new];
        newChannelList.channelId = channelList.channelId;
        newChannelList.channelTitle = channelList.channelTitle;
        newChannelList.channelStbNumber = channelList.channelStbNumber;
        newChannelList.loginId = (channelList.isFavoriteSelected)? @"" : facebookLoginId;
        newChannelList.isFavoriteSelected = (channelList.isFavoriteSelected)? NO : YES;
        [_channelListStorage updateChannelList:newChannelList]
        .then(^{
            Favourite *newFavourite = [Favourite new];
            newFavourite.channelId = newChannelList.channelId;
            newFavourite.channelStbNumber = newChannelList.channelStbNumber;
            newFavourite.channelTitle = newChannelList.channelTitle;
            newFavourite.isFavoriteSelected = newChannelList.isFavoriteSelected;
            newFavourite.loginId = newChannelList.loginId;
            [_selectedItemsStorage saveFavourite:newFavourite]
            .then(^{
                [self getChannelList];
            });
        });
    }
    else
    {
        UINib *customNib = [UINib nibWithNibName:@"FacebookLoginView" bundle:nil];
        _facebookLoginView = [[customNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        _facebookLoginView.delegate = self;
        _popup = [KLCPopup popupWithContentView:_facebookLoginView];
        _popup.showType = KLCPopupShowTypeBounceInFromTop;
        _popup.shouldDismissOnContentTouch = NO;
        _popup.shouldDismissOnBackgroundTouch = NO;
        [_popup show];
    }
}

#pragma  mark Navigation bar logout button

- (void) navigationBarLogoutButton
{
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Logout"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(logoutButtonAction:)];
    if ([FBSDKAccessToken currentAccessToken]) {
        self.navigationItem.rightBarButtonItem = flipButton;
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@  and Email : %@", result,result[@"id"]);
                 facebookLoginId = result[@"id"];
                 
             }
         }];
    }
    else
    {
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor clearColor];
    }
}

#pragma mark -  Logout Action

- (void) logoutButtonAction: (id)sender
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];
    [self navigationBarLogoutButton];
    [self getChannelList];
}

#pragma mark - Pop close action

- (void) cancelThePopUpWithLoginInfo
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             [self getChannelList];
             [self navigationBarLogoutButton];
         }
     }];
    [_popup dismiss:YES];
    
}

- (void) cancelThePopUp
{
    [_popup dismiss:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
