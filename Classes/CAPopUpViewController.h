//
//  CAPopUpViewController.h
//  ContrAlert
//
//  Created by Mokhlas Hussein on 16/09/15.
//  Copyright © 2015 iMokhles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAPopUpViewController : UIViewController

// popover source view
@property (nonatomic, strong) UIView *sourceView;

// menu items array
@property (nonatomic, strong) NSArray *itemsArray;

// set background image
@property (nonatomic, strong) UIImage *backgroundImage;

// set to clear if you set the backgroundImage
@property (nonatomic, strong) UIColor *backgroundColor;

// item title color
@property (nonatomic, strong) UIColor *itemTitleColor;

// item selection background
@property (nonatomic, strong) UIColor *itemSelectionColor;

// popover arrow direction
@property (nonatomic, assign) UIPopoverArrowDirection arrowDirections;

// popover arrow color
@property (nonatomic, strong) UIColor *arrowColor;

// item cell tapped block
@property (nonatomic, copy) void (^popCellBlock)(CAPopUpViewController * popupVC, UITableViewCell *popCell, NSInteger row, NSInteger section);

@end
