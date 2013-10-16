//
//  SJSceneViewController.m
//  SJLargeTexture
//
//  Created by Tatsuya Tobioka on 2013/10/16.
//  Copyright (c) 2013年 tnantoka. All rights reserved.
//

#import "SJSceneViewController.h"

#import "SJScene.h"

#import <SpriteKit/SpriteKit.h>

@interface SJSceneViewController ()

@end

@implementation SJSceneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    SKView *skView = [[SKView alloc] initWithFrame:applicationFrame];
    
#ifdef DEBUG
    skView.showsDrawCount = YES;
    skView.showsNodeCount = YES;
    skView.showsFPS = YES;
#endif
    
    self.view = skView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = _size;
    
    SKView *skView = (SKView *)self.view;
    SKScene *scene = [SJScene sceneWithSize:self.view.bounds.size];
    
    //SKTexture *image = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"tilesheet-%@", _size]];
    //SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:image];
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:[NSString stringWithFormat:@"tilesheet-%@", _size]];
    sprite.anchorPoint = CGPointMake(0, 0);
    [scene addChild:sprite];

    [skView presentScene:scene];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
