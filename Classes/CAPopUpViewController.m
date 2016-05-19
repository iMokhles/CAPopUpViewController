//
//  CAPopUpViewController.m
//  ContrAlert
//
//  Created by Mokhlas Hussein on 16/09/15.
//  Copyright © 2015 iMokhles. All rights reserved.
//

#import "CAPopUpViewController.h"

@interface CAPopUpViewController () <UIPopoverPresentationControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CAPopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, 230, (self.itemsArray.count*44));
    self.preferredContentSize = CGSizeMake(230, (self.itemsArray.count*44));
    self.popoverPresentationController.sourceView = self.sourceView;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    if (self.backgroundImage != nil && self.backgroundColor == nil) {
        UIImageView *tempImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
        [tempImageView setFrame:self.tableView.frame];
        self.tableView.backgroundView = tempImageView;
        self.tableView.backgroundColor = [UIColor clearColor];
    } else if (self.backgroundImage != nil && self.backgroundColor != nil) {
        UIImageView *tempImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
        [tempImageView setFrame:self.tableView.frame];
        self.tableView.backgroundView = tempImageView;
        self.tableView.backgroundColor = [UIColor clearColor];
    } else if (self.backgroundImage == nil && self.backgroundColor != nil) {
        self.tableView.backgroundColor = self.backgroundColor;
    } else {
        
        self.tableView.backgroundColor = [UIColor whiteColor];
    }
    
    
    self.popoverPresentationController.sourceRect = CGRectMake(0, 0, 230, 30);
    self.popoverPresentationController.permittedArrowDirections = self.arrowDirections;
    self.popoverPresentationController.backgroundColor = [UIColor whiteColor];
    
    if (self.arrowColor != nil) {
        self.popoverPresentationController.backgroundColor = self.arrowColor;
    }
    [self.tableView reloadData];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (id)init {
    if (self == [super initWithNibName:nil bundle:nil]) {
        self.modalPresentationStyle = UIModalPresentationPopover;
        self.popoverPresentationController.delegate = self;
    }
    return self;
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"popupCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"popupCell"];
    }
    
    cell.textLabel.text = self.itemsArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.popCellBlock != nil) {
        self.popCellBlock(self, cell, indexPath.row, indexPath.section);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (self.itemTitleColor != nil) {
        cell.textLabel.textColor = self.itemTitleColor;
    }
    
    if (self.backgroundImage == nil && self.backgroundColor == nil) {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    UIView * additionalSeparator = [[UIView alloc] initWithFrame:CGRectMake(0,cell.frame.size.height,cell.frame.size.width,1)];
    additionalSeparator.backgroundColor = [UIColor lightGrayColor];
    [cell addSubview:additionalSeparator];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor lightGrayColor];
    if (self.itemSelectionColor != nil) {
        bgColorView.backgroundColor = self.itemSelectionColor; //[UIColor hex:@"283146"];
    }
    
    [cell setSelectedBackgroundView:bgColorView];
    cell.textLabel.alpha = 1.0;
    
}

@end
