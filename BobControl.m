//
//  BobControl.m
//  BobControl
//
//  Created by Bob on 14/6/20.
//  Copyright © 2014年 zangwb. All rights reserved.
//

#import "BobControl.h"
#define IOS7   [[UIDevice currentDevice]systemVersion].floatValue>=7.0

@implementation BobControl

#pragma mark - label

//label
+(UILabel*)labelWithFrame:(CGRect)frame andFont:(UIFont *)font andText:(NSString*)text
{
    
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    //限制行数
    label.numberOfLines=0;
    //对齐方式
    //    label.textAlignment=NSTextAlignmentLeft;
    label.backgroundColor=[UIColor clearColor];
    label.font= font;
    //单词折行
    //    label.lineBreakMode=NSLineBreakByWordWrapping;
    //默认字体颜色是白色
    label.textColor=[UIColor blackColor];
    //自适应（行数~字体大小按照设置大小进行设置）
    //    label.adjustsFontSizeToFitWidth=YES;
    label.text=text;
    return label;
    
}

//居中字体的label
+(UILabel *)labWithFrame:(CGRect)frame andTextColor:(UIColor *)textColor andFont:(UIFont *)font andText:(NSString *)text{
    UILabel *lab1 = [self labelWithFrame:frame andFont:font andText:text];
    lab1.textColor = textColor;
    lab1.textAlignment = NSTextAlignmentCenter;
    return lab1;
}

//15号字专用的
+(UILabel *)labWithX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andContent:(NSString *)content{
    
    UILabel * lab = [self labelWithFrame:CGRectMake(x, y, width, 15) andFont:[UIFont systemFontOfSize:15] andText:content];
    return lab;
}

/*
 *value 是屏幕上的 y的 值
 */
+(void)calculateFrameOfLabel:(UILabel *)lab andAddValue:(CGFloat)value{
    
    lab.numberOfLines = 0;
    lab.font = [UIFont systemFontOfSize:15];
    lab.textColor = [UIColor blackColor];
    NSDictionary * attributes = [NSDictionary dictionaryWithObject:lab.font forKey:NSFontAttributeName];
    
    CGRect rect = [lab.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 24, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    lab.frame = CGRectMake(12, value, [UIScreen mainScreen].bounds.size.width - 24, rect.size.height);
}

+(UILabel *)labelWithFrame:(CGRect)frame Font:(UIFont *)font Text:(NSString *)text andAttributeColor:(UIColor *)color{
    UILabel * footerLab = [[UILabel alloc] initWithFrame:frame];
    
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:text];
    NSRange contentRange = {0,[content length]};
    
    //    加下划线
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    
    [content addAttribute:NSFontAttributeName value: font range:contentRange];
    
    footerLab.attributedText = content;
    
    footerLab.textColor = color;
    
    footerLab.textAlignment = NSTextAlignmentCenter;
    
    
    //    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoGZWater)];
    //
    //    [footerLab addGestureRecognizer:tap];
    
    footerLab.userInteractionEnabled = YES;
    
    return footerLab;
}


#pragma mark - button
//有两种图片样式的按钮
+ (UIButton *)buttonWithFrame:(CGRect)frame andImage:(UIImage *)image andHighlightedImage:(UIImage *)highlightedImg andTarget:(id)target andSelector:(SEL)selector {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightedImg forState:UIControlStateHighlighted];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


//
+ (UIButton *)backButtonWithSelector:(SEL)selector andTarget:(id)target{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(12, 27, 72, 34);
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
    //    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    //    [btn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    //    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    return btn;
}



+(UIButton*)buttonWithFrame:(CGRect)frame ImageName:(NSString*)imageName Target:(id)target Action:(SEL)action Title:(NSString*)title
{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    [button setTitle:title forState:UIControlStateNormal];
    
    //设置背景图片，可以使文字与图片共存
    //    [button setBackgroundImage:[UIImage imageNamed:imageName.length?imageName:@"11"] forState:UIControlStateNormal];
    
    // [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
    
}


+(UIButton *)btnWithFrame:(CGRect)frame andTitleColor:(UIColor *)textColor andFont:(UIFont *)font andTitle:(NSString *)text andBackgroundImage:(UIImage*)image andTarget:(id)target andAction:(SEL)action{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    
    
    btn.titleLabel.font = font;
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithPatternImage:image];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton *)btnWithFrame:(CGRect)frame andImage:(UIImage *)image andImageWidth:(CGFloat)imageWidth{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    UIImageView *backImage = [[UIImageView alloc] initWithImage:image];
    if (kScreenWidth < 323) {
        imageWidth = 24;
    }
    backImage.frame = CGRectMake((frame.size.width - imageWidth)/2.0, (frame.size.width - imageWidth)/2.0, imageWidth, imageWidth);
    [btn addSubview:backImage];
    return btn;
}

//这个可以上下放 图片和文字， 上面是图片  下面是文字
+(UIButton *)btnWithFrame:(CGRect)frame andImage:(UIImage*)image andTitle:(NSString *)title andTitleColor:(UIColor *)color andFont:(UIFont *)font andTag:(NSInteger)taga{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor whiteColor];
    btn.frame = frame;
    btn.tag = taga;
    
    UIImageView *backImage = [[UIImageView alloc] initWithImage:image];
    backImage.frame = CGRectMake(0, PROPORTION(36), PROPORTION(50), PROPORTION(50));
    backImage.centerX = kScreenWidth/6;
    [btn addSubview:backImage];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, backImage.bottom+PROPORTION(12), kScreenWidth/3, 15)];
    lab.textColor = [UIColor blackColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = title;
    lab.font = font;
    [btn addSubview:lab];
    
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    
    //    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}



#pragma mark - image || view


+(UIImageView*)imageViewWithFrame:(CGRect)frame ImageName:(NSString*)imageName
{
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=[UIImage imageNamed:imageName];
    imageView.userInteractionEnabled=YES;
    return imageView ;
}

+(UIView*)viewWithFrame:(CGRect)frame
{
    UIView*view=[[UIView alloc]initWithFrame:frame];
    
    return view ;
}

+(UIView *)lineWithY:(CGFloat)y{
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(PROPORTION(24), y, kScreenWidth - PROPORTION(48), ONE_PIXEL)];
    line.backgroundColor = [UIColor blackColor];
    return line;
}


#pragma  mark - UITextField


+(UITextField*)textFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font backgRoundImageName:(NSString*)imageName
{
    UITextField*textField=[[UITextField alloc]initWithFrame:frame];
    //灰色提示框
    textField.placeholder=placeholder;
    //文字对齐方式
    textField.textAlignment=NSTextAlignmentLeft;
    textField.secureTextEntry=YESorNO;
    //边框
    //textField.borderStyle=UITextBorderStyleLine;
    //键盘类型
    textField.keyboardType=UIKeyboardTypeEmailAddress;
    //关闭首字母大写
    textField.autocapitalizationType=NO;
    //清除按钮
    textField.clearButtonMode=YES;
    //左图片
    textField.leftView=imageView;
    textField.leftViewMode=UITextFieldViewModeAlways;
    //右图片
    textField.rightView=rightImageView;
    //编辑状态下一直存在
    textField.rightViewMode=UITextFieldViewModeWhileEditing;
    //自定义键盘
    //textField.inputView
    //字体
    textField.font=[UIFont systemFontOfSize:font];
    //字体颜色
    textField.textColor=[UIColor blackColor];
    
    textField.background=[UIImage imageNamed:imageName];
    return  textField;
    
}


#pragma  mark - UITextView


+(UITextView*)textViewWithFrame:(CGRect)frame andFont:(float)font andCornerRadius:(CGFloat)radius
{
    UITextView * textView = [[UITextView alloc]initWithFrame:frame];
    //文字对齐方式
    textView.textAlignment=NSTextAlignmentLeft;
    //关闭首字母大写
    textView.autocapitalizationType=NO;
    //字体
    textView.font=[UIFont systemFontOfSize:font];
    //字体颜色
    textView.textColor=[UIColor blackColor];
    return  textView;
    
    
    
}




@end
