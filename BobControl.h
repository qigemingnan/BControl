//
//  BobControl.h
//  BobControl
//
//  Created by Bob on 14/6/20.
//  Copyright © 2014年 zangwb. All rights reserved.
//



@interface BobControl : NSObject

#pragma mark --创建Label
+(UILabel*)labelWithFrame:(CGRect)frame andFont:(UIFont *)font andText:(NSString*)text;

//带颜色控制的
+(UILabel *)labWithFrame:(CGRect)frame andTextColor:(UIColor *)textColor andFont:(UIFont *)font andText:(NSString *)text;

//
+(UILabel *)labWithX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andContent:(NSString *)content;

+(void)calculateFrameOfLabel:(UILabel *)lab andAddValue:(CGFloat)value;

+(UILabel *)labelWithFrame:(CGRect)frame Font:(UIFont *)font Text:(NSString *)text andAttributeColor:(UIColor *)color;


#pragma mark --创建button

+ (UIButton *)buttonWithFrame:(CGRect)frame andImage:(UIImage *)image andHighlightedImage:(UIImage *)highlightedImg andTarget:(id)target andSelector:(SEL)selector;


+ (UIButton *)backButtonWithSelector:(SEL)selector andTarget:(id)target;

+(UIButton*)buttonWithFrame:(CGRect)frame ImageName:(NSString*)imageName Target:(id)target Action:(SEL)action Title:(NSString*)title;


+(UIButton *)btnWithFrame:(CGRect)frame andTitleColor:(UIColor *)textColor andFont:(UIFont *)font andTitle:(NSString *)text andBackgroundImage:(UIImage*)image andTarget:(id)target andAction:(SEL)action;

+(UIButton *)btnWithFrame:(CGRect)frame andImage:(UIImage *)image andImageWidth:(CGFloat)imageWidth;

+(UIButton *)btnWithFrame:(CGRect)frame andImage:(UIImage*)image andTitle:(NSString *)title andTitleColor:(UIColor *)color andFont:(UIFont *)font andTag:(NSInteger)taga;



#pragma mark --创建View
+(UIView*)viewWithFrame:(CGRect)frame;
+(UIView *)lineWithY:(CGFloat)y;



#pragma mark --创建imageView
+(UIImageView*)imageViewWithFrame:(CGRect)frame ImageName:(NSString*)imageName;




#pragma mark --创建UITextField
+(UITextField*)textFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font backgRoundImageName:(NSString*)imageName;

#pragma mark --创建UITextView
+(UITextView*)textViewWithFrame:(CGRect)frame andFont:(float)font andCornerRadius:(CGFloat)radius;

@end
