//
//  MessageCell.m
//  LofterOC
//
//  Created by Elise on 16/9/18.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "MessageCell.h"

@interface MessageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageIconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *lightGrayLine;


@end

@implementation MessageCell

#pragma mark - lifeCycle

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - class func

+ (MessageCell *)loadMessageCellWithTableView:(UITableView *)tableView {
    NSString *idStr = @"messageCell";
    MessageCell *messageCell = [tableView dequeueReusableCellWithIdentifier:idStr];
    if (messageCell == nil) {
        messageCell = (MessageCell *)[[NSBundle mainBundle] loadNibNamed:@"MessageCell" owner:nil options:nil].lastObject;
    }
    return messageCell;
}



@end
