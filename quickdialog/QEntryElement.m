//                                
// Copyright 2011 ESCOZ Inc  - http://escoz.com
// 
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this 
// file except in compliance with the License. You may obtain a copy of the License at 
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software distributed under
// the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF 
// ANY KIND, either express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

@implementation QEntryElement

@synthesize textValue = _textValue;
@synthesize placeholder = _placeholder;
@synthesize hiddenToolbar = _hiddenToolbar;

@synthesize delegate = _delegate;

- (QEntryElement *)init {
    self = [super init];
    if (self){
        self.autocapitalizationType = UITextAutocapitalizationTypeSentences;
        self.autocorrectionType = UITextAutocorrectionTypeDefault;
        self.keyboardType = UIKeyboardTypeDefault;
        self.keyboardAppearance = UIKeyboardAppearanceDefault;
        self.returnKeyType = UIReturnKeyDefault;
        self.enablesReturnKeyAutomatically = NO;
        self.secureTextEntry = NO;
    }
    return self;
}

- (QEntryElement *)initWithTitle:(NSString *)title Value:(NSString *)value Placeholder:(NSString *)placeholder {
    self = [self init];
    if (self) {
        _title = title;
        _textValue = value;
        _placeholder = placeholder;
    }
    return self;
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {

    QEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuickformEntryElement"];
    if (cell==nil){
        cell = [[QEntryTableViewCell alloc] init];
    }
    cell.textField.enabled = YES;
    [cell prepareForElement:self inTableView:tableView];
    return cell;
}

- (void)selected:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller indexPath:(NSIndexPath *)indexPath {
    [super selected:tableView controller:controller indexPath:indexPath];

}

- (void)fetchValueIntoObject:(id)obj {
	if (_key==nil)
		return;
	
	[obj setValue:_textValue forKey:_key];
}


#pragma mark - UITextInputTraits

@synthesize autocorrectionType = _autocorrectionType;
@synthesize autocapitalizationType = _autocapitalizationType;
@synthesize keyboardType = _keyboardType;
@synthesize keyboardAppearance = _keyboardAppearance;
@synthesize returnKeyType = _returnKeyType;
@synthesize enablesReturnKeyAutomatically = _enablesReturnKeyAutomatically;
@synthesize secureTextEntry = _secureTextEntry;

@end