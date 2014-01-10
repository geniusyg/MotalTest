//
//  ViewController.m
//  MotalTest
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nameChanged:)name:@"UserNameChanged" object:nil];
}

- (void)nameChanged:(NSNotification *)noti {
	NSDictionary *info = noti.userInfo;
	
	self.label.text = info[@"username"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showSignUp:(id)sender {
	UIStoryboard *storyboard = self.storyboard;
	
	UIViewController *signUpController= [storyboard instantiateViewControllerWithIdentifier:@"SignUp"];
	
	[self presentViewController:signUpController animated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	//로그인을 한적이 없으면 바로 로그인 창으로 이동
	
	BOOL isLoggedIn = YES;
	
	if(!isLoggedIn)
		[self performSegueWithIdentifier:@"modalSegue" sender:self];
	
}

@end





















