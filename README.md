# PullDownView
简单易用的下拉列表
## 使用 （支持IB和代码）
##### IB用法
直接拖UIView到IB上，设置为PullDownView，代码部分只需要实现

```objc
//快速创建
__weak typeof(self) weakSelf = self;
[self.pullDownView1 pullDownWithListArray:@[@"中国",@"法国",@"英国",@"日本",@"韩国",@"伊拉克"] AndTitle:@"中国" OpenClick:^{
    NSLog(@"打开");
} selectItem:^(NSInteger index) {
    NSLog(@"点击了第%ld个",index);
}];
```

##### 代码实现（Masonry）用法
```objc
self.pullDownView2 = [PullDownView pullDownWithFrame:CGRectMake(200, 300, 100, 40) ListArray:@[@"小明",@"xiaoh",@"aaaa"] AndTitle:@"哈哈" OpenClick:^{
    NSLog(@"打开");
} selectItem:^(NSInteger index) {
    NSLog(@"点击了第%ld个",index);
}];
[self.view addSubview:self.pullDownView2];
```

##### 关闭
```objc
[self.tempPullDown closeTableFast];
```
# 期待
- 如果在使用过程中遇到BUG，或发现功能不够用，希望你能Issues我,或者微博联系我：[@李洋](https://weibo.com/u/3297900977)
- 如果觉得好用请Star!
