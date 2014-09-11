//
//  DropitViewController.m
//  Dropit
//
//  Created by Zeng Sean on 2014/9/6.
//  Copyright (c) 2014年 Sean, Zeng. All rights reserved.
//

#import "DropitViewController.h"

@interface DropitViewController ()
@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collision;

@end

@implementation DropitViewController

static const CGSize DROP_SIZE = { 40 , 40 };


- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    [self drop];
}



-(UIDynamicAnimator *) animator
{
    if( !_animator)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
        
    }
    return _animator;
}

-(UIGravityBehavior *) gravity
{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.9;
        [self.animator addBehavior:_gravity];
    }
    return _gravity;
}

-(UICollisionBehavior *) collision
{
    if (!_collision)
    {
        _collision =[[UICollisionBehavior alloc] init];
        _collision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:_collision];
    }
    return _collision;
}



-(void)drop
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    int x = (arc4random()% (int)self.gameView.bounds.size.width) / DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;
    
    
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    
    dropView.backgroundColor = [self randomColor];
    [self.gameView addSubview:dropView];
    
    [self.gravity addItem:dropView];
    [self.collision addItem:dropView];
    
}
-(UIColor *) randomColor
{
    switch (arc4random()%5) {
        case 1: return [UIColor greenColor];
        case 2: return [UIColor blueColor];
        case 3: return [UIColor orangeColor];
        case 4: return [UIColor redColor];
        case 5: return [UIColor purpleColor];
            
    }
    return [UIColor blackColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
