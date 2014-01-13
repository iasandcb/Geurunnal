//
//  ViewController.m
//  Geurunnal
//
//  Created by ias on 2014. 1. 13..
//  Copyright (c) 2014년 ias. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController {
    sqlite3 *db;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self openDB];
    [self selectMessages];
}

- (void)openDB {
    NSString *dbFilePath = [[NSBundle mainBundle] pathForResource:@"db" ofType:@"sqlite"];
    int ret = sqlite3_open([dbFilePath UTF8String], &db);
    NSAssert1(SQLITE_OK == ret, @"Error on opening Database: %s", sqlite3_errmsg(db));
    NSLog(@"Success");
}

- (void)selectMessages {
    NSString *queryStr = @"SELECT * from message";
    sqlite3_stmt *stmt;
    sqlite3_prepare_v2(db, [queryStr UTF8String], -1, &stmt, NULL);
    while (SQLITE_ROW == sqlite3_step(stmt)) {
        char *sender = (char *)sqlite3_column_text(stmt, 0);
        NSString *senderString = [NSString stringWithCString:sender encoding:NSUTF8StringEncoding];
        NSLog(@"sender %@", senderString);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
