//
//  ViewController.m
//  BaseCounter
//
//  Created by 吴凯强 on 15/11/23.
//  Copyright © 2015年 吴凯强. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSArray *fuArray;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,assign)CGFloat num1;
@property(nonatomic,assign)CGFloat num2;
@property(nonatomic,retain)NSMutableString *string;
@property(nonatomic,strong)NSString *str;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
    
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/7*2)];
    _label.text = @"0";
    _label.backgroundColor = [UIColor grayColor];
    _label.textAlignment = NSTextAlignmentRight;
    _label.font = [UIFont systemFontOfSize:60];
    [self.view addSubview:_label];
    
    _array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    //添加1-9数字
    NSInteger index = 0;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            self.button = [UIButton buttonWithType:UIButtonTypeSystem];
            
            self.button.frame = CGRectMake(0+self.view.bounds.size.width/4 * j, self.view.bounds.size.height/7*3 + self.view.bounds.size.height/7*i, self.view.bounds.size.width/4, self.view.bounds.size.height/7);
            [self.button setTitle:_array[index] forState:UIControlStateNormal];
            self.button.titleLabel.font = [UIFont systemFontOfSize:30];
            index++;
            self.button.backgroundColor = [UIColor clearColor];
            self.button.layer.borderWidth = 0.5;
            self.button.layer.borderColor = [UIColor blackColor].CGColor;
            [self.button addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:self.button];
            if (index == _array.count) {
                break;
            }
            
        }
    }
    //添加运算符
    _fuArray = @[@"+",@"-",@"×",@"÷"];
    NSInteger fuIndex = 0;
    for (int i = 0 ; i < 4; i++) {
        for (int j = 0; j < 1; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(self.view.bounds.size.width/4*3, self.view.bounds.size.height/7*2 + self.view.bounds.size.height/7 * i , self.view.bounds.size.width/4, self.view.bounds.size.height/7);
            
            [button setTitle:_fuArray[fuIndex] forState:UIControlStateNormal];
            fuIndex++;
            button.titleLabel.font = [UIFont systemFontOfSize:30];
            
            button.backgroundColor = [UIColor orangeColor];
            button.layer.borderWidth = 0.5;
            button.layer.borderColor = [UIColor blackColor].CGColor;
            
            [button addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
            if (fuIndex == _fuArray.count) {
                break;
            }
        }
    }
    
    //添加=
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(self.view.bounds.size.width/4*3, self.view.bounds.size.height/7*6 , self.view.bounds.size.width/4, self.view.bounds.size.height/7);
    [button setTitle:@"=" forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    
    button.backgroundColor = [UIColor orangeColor];
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.tag = 120;
    [button addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //添加0
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, self.view.bounds.size.height/7*6 , self.view.bounds.size.width/4 * 2, self.view.bounds.size.height/7);
    
    
    [button1 setTitle:@"0" forState:UIControlStateNormal];
    
    button1.titleLabel.font = [UIFont systemFontOfSize:30];
    
    button1.backgroundColor = [UIColor clearColor];
    button1.layer.borderWidth = 0.5;
    button1.layer.borderColor = [UIColor blackColor].CGColor;
    button1.tag = 120;
    [button1 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    //添加 .
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(self.view.bounds.size.width/4 * 2, self.view.bounds.size.height/7*6 , self.view.bounds.size.width/4, self.view.bounds.size.height/7);
    
    [button2 setTitle:@"." forState:UIControlStateNormal];
    
    button2.titleLabel.font = [UIFont systemFontOfSize:30];
    
    button2.backgroundColor = [UIColor clearColor];
    button2.layer.borderWidth = 0.5;
    button2.layer.borderColor = [UIColor blackColor].CGColor;
    [button2 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    //清除键
    UIButton *button3=[UIButton buttonWithType:UIButtonTypeSystem];
    [button3 setFrame:CGRectMake(0, self.view.bounds.size.height/7*2, self.view.bounds.size.width/4, self.view.bounds.size.height/7)];
    button3.backgroundColor = [UIColor clearColor];
    button3.layer.borderWidth = 0.5;
    button3.layer.borderColor = [UIColor blackColor].CGColor;
    button3.titleLabel.font = [UIFont systemFontOfSize:30];
    [button3 setTitle:@"AC" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(clean:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
    // +/-
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button5 setFrame:CGRectMake(self.view.bounds.size.width/4, self.view.bounds.size.height/7*2, self.view.bounds.size.width/4, self.view.bounds.size.height/7)];
    [button5 setTitle:@"+/-" forState:UIControlStateNormal];
    button5.backgroundColor = [UIColor clearColor];
    button5.layer.borderWidth = 0.5;
    button5.layer.borderColor = [UIColor blackColor].CGColor;
    button5.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:button5];
    
    // %
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button6 setFrame:CGRectMake(self.view.bounds.size.width/4*2, self.view.bounds.size.height/7*2, self.view.bounds.size.width/4, self.view.bounds.size.height/7)];
    [button6 setTitle:@"%" forState:UIControlStateNormal];
    button6.backgroundColor = [UIColor clearColor];
    button6.layer.borderWidth = 0.5;
    button6.layer.borderColor = [UIColor blackColor].CGColor;
    button6.titleLabel.font = [UIFont systemFontOfSize:30];
    [button6 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button6];
    
    self.string=[[NSMutableString alloc]init];//初始化可变字符串，分配内存
    self.str = [[NSString alloc]init];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//0-9方法
- (void)shuzi:(id)sender
{
    
    [self.string appendString:[sender currentTitle]];      //数字连续输入
    self.label.text=[NSString stringWithString:_string];   //显示数值
    self.num1=[self.label.text doubleValue];               //保存输入的数值
    NSLog(@"self.num1  is  %f",self.num1);
    
}


//计算方法
-(void)go:(id)sender
{
    if ([self.str isEqualToString:@""])//当str里为空
    {
        self.num2=self.num1;
        NSLog(@"self.num2 = %.2f",self.num2);
        self.label.text=[NSString stringWithString:_string];//只要是符号就显示数值
        [self.string setString:@""];//字符串清零
        self.str=[sender currentTitle];//保存运算符为了作判断作何种运算
        NSLog(@"%@",_str);
        [self.string appendString:self.str];
        self.label.text=[NSString stringWithString:_string];//显示数值
        [self.string setString:@""];//字符串清零
    }
    else
    {
        //输出上次计算结果
        if ([self.str isEqualToString:@"+"])//之前的符号是+
        {
            [self.string setString:@""];//字符串清零
            self.num2+=self.num1;//num2是运算符号左边的数值，还是计算结果
            
            //输出上次结果后判断这次输入的是何符号
            if ([[sender currentTitle]isEqualToString:@"="])
            {
                NSLog(@"self.num2 = %.2f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%.2f",self.num2];
                self.str=@"";
            }
            
        }
        
        else if ([self.str isEqualToString:@"-"])//之前的符号是-
        {
            [self.string setString:@""];//字符串清零
            self.num2-=self.num1;
            //输出上次结果后判断这次输入的是何符号
            if ([[sender currentTitle]isEqualToString:@"="])
            {
                NSLog(@"self.num2 = %.2f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%.2f",self.num2];
                self.str=@"";
            }
            
        }
        
        else if([self.str isEqualToString:@"×"])//之前的符号是× hasPrefix:方法的功能是判断创建的字符串内容是否以某个字符开始
        {
            [self.string setString:@""];//字符串清零
            self.num2*=self.num1;
            //输出上次结果后判断这次输入的是何符号
            if ([[sender currentTitle] isEqualToString:@"="])
            {
                NSLog(@"self.num2 = %.2f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%.2f",self.num2];
                self.str=@"";
            }
        }
        
        else if ([self.str isEqualToString:@"÷"])//之前的符号是÷
        {
            [self.string setString:@""];//字符串清零
            self.num2/=self.num1;
            //判断输出上次结果后判断这次输入的是何符号
            if ([[sender currentTitle]isEqualToString:@"="])
            {
                NSLog(@"self.num2 = %.2f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%.2f",self.num2];
                self.str=@"";
            }
        }
        
    }
}


//当按下清除建时，所有数据清零
-(void)clean:(id)sender
{
    [self.string setString:@""];//清空字符
    self.num1=0;
    self.num2=0;
    self.label.text=@"0";//保证下次输入时清零
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
