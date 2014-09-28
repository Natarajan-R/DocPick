//
//  ViewController.m
//  DocPick
//
//  Created by Don Southard on 9/28/14.
//  Copyright (c) 2014 Reactiv Code, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIDocumentPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/*
 *
 * Import Document Picker
 *
 */
- (IBAction)openImportDocumentPicker:(id)sender {
    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[@"public.image"]
                                                                                                            inMode:UIDocumentPickerModeImport];
    documentPicker.delegate = self;
    documentPicker.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:documentPicker animated:YES completion:nil];
}


/*
 *
 * Handle Incoming File
 *
 */
- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    NSString *alertMessage = [NSString stringWithFormat:@"Successfully imported %@", [url lastPathComponent]];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Import"
                                              message:alertMessage
                                              preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    });
    return;
}

/*
 *
 * Export Document Picker
 *
*/
- (IBAction)openExportDocumentPicker:(id)sender {
    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithURL:[[NSBundle mainBundle] URLForResource:@"image" withExtension:@"jpg"]
                                                                                                  inMode:UIDocumentPickerModeExportToService];
    documentPicker.delegate = self;
    documentPicker.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:documentPicker animated:YES completion:nil];
}

/*
 *
 * Cancelled
 *
 */
- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller {
    NSLog(@"Cancelled");
}

@end
