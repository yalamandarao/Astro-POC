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

@interface HomeViewController ()
{
    NSMutableArray *channelArray;
}
@property (nonatomic, strong) IBOutlet UITableView *channelTableView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
}

 - (void) getChannelList
{
    [_getChannelListService getChannelListData]
    .then(^(NSDictionary *result){
        
        NSLog(@"reuslt data %@",result);
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ChannelTableViewCellID";
    ChannelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.channelTittle.text = @"HBO";
    cell.channelNumber.text = @"343";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 60;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
}

@end
