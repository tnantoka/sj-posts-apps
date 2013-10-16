//
//  SJViewController.m
//  SJLargeTexture
//
//  Created by Tatsuya Tobioka on 2013/10/16.
//  Copyright (c) 2013年 tnantoka. All rights reserved.
//

#import "SJViewController.h"

#import "SJSceneViewController.h"

@interface SJViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SJViewController {
    UITableView *_tableView;
    NSArray *_sizes;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Large texture";
        _sizes = @[
                    @[@"200x4096", @"OK"],
                    @[@"200x4097", @"NG"],
                    @[@"600x4096", @"OK"],
                    @[@"100x4097", @"NG"],
                    ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [_tableView deselectRowAtIndexPath:_tableView.indexPathForSelectedRow animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sizes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *size = _sizes[indexPath.row][0];
    NSString *status = _sizes[indexPath.row][1];
    cell.textLabel.text = [NSString stringWithFormat:@"[%@] %@", status, size];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *size = _sizes[indexPath.row][0];
    SJSceneViewController *sceneController = SJSceneViewController.new;
    sceneController.size = size;
    [self.navigationController pushViewController:sceneController animated:YES];
}

@end
