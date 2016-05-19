# CAPopUpViewController
is a simple popup menu see screenshot for more info

[![Version](https://img.shields.io/cocoapods/v/CAPopUpViewController.svg?style=flat)](http://cocoadocs.org/docsets/CAPopUpViewController)
[![License](https://img.shields.io/cocoapods/l/CAPopUpViewController.svg?style=flat)](http://cocoadocs.org/docsets/CAPopUpViewController)
[![Platform](https://img.shields.io/cocoapods/p/CAPopUpViewController.svg?style=flat)](http://cocoadocs.org/docsets/CAPopUpViewController)

<p align="center">
  <img width="420" src="screenshot.jpg"/>
</p>

### Usage

CAPostEditorViewControlleravailable through [CocoaPods](http://cocoapods.org). To install
it, add the following line to your Podfile:

    pod "CAPopUpViewController"
    
or drag the files manually then import it

    #import "CAPopUpViewController.h"

### Example

    NSString *sendName = [[NSBundle mainBundle] localizedStringForKey:@"Send" value:@"" table:nil];
    NSString *schuName = [[NSBundle mainBundle] localizedStringForKey:@"Schedule" value:@"" table:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        CAPopUpViewController *popup = [[CAPopUpViewController alloc] init];
        popup.itemsArray = @[sendName, schuName];
        popup.sourceView = self.contentView.sendButton;
        popup.backgroundColor = [UIColor whiteColor];
        popup.backgroundImage = nil;
        popup.itemTitleColor = [UIColor blackColor];
        popup.itemSelectionColor = [UIColor lightGrayColor];
        popup.arrowDirections = UIPopoverArrowDirectionAny;
        popup.arrowColor = [UIColor whiteColor];
        [popup setPopCellBlock:^(CAPopUpViewController *popupVC, UITableViewCell *popupCell, NSInteger row, NSInteger section) {
            if ([popupCell.textLabel.text isEqualToString:sendName]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [popupVC dismissViewControllerAnimated:YES completion:^{
                        
                    }];
                });
                
            } else if ([popupCell.textLabel.text isEqualToString:schuName]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [popupVC dismissViewControllerAnimated:YES completion:^{
                        
                    }];
                });
            }
        }];
        [self.delegate presentViewController:popup animated:YES completion:^{
            
        }];
    });

## Author

[Mokhlas Hussein (iMokhles)](https://twitter.com/imokhles), [mokhleshussien@gmail.com](mailto:mokhleshussien@aol.com)

### License

    Copyright (c) 2016, Mokhlas Hussein
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
    
    * Redistributions of source code must retain the above copyright notice, this
      list of conditions and the following disclaimer.
    
    * Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.
    
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
    FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
    DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
    SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
