import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//主函数。 Flutter 应用的入口
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GestureTestWidget(),
      ),
    ),
  );
}

//   简单的演示应用程序，由两个容器组成。目标是允许多个手势进入竞技场。
//  所有的东西都是通过 `RawGestureDetector` 和自定义 `GestureRecognizer` （继承自 `TapGestureRecognizer` ）
//  将自定义 GestureRecognizer，`AllowMultipleGestureRecognizer` 添加到手势列表中，并创建一个 `AllowMultipleGestureRecognizer` 类型的 `GestureRecognizerFactoryWithHandlers`。
//  它用给定的回调创建一个手势识别器工厂函数，在这里是 `onTap`。
//  它监听 `onTap` 的一个实例，然后在被调用时向控制台打印文本。需要注意的是，`RawGestureDetector` 对于两个容器
//  是相同的。唯一的区别是打印的文本（用来标识组件）。

class GestureTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<
            AllowMultipleGestureRecognizer>(
              () => AllowMultipleGestureRecognizer(),
              (AllowMultipleGestureRecognizer instance) {
            instance.onTap = () => print('Episode 4 is best! (parent container) ');
          },
        )
      },
      behavior: HitTestBehavior.opaque,
      //父容器
      child: Container(
        color: Colors.blueAccent,
        child: Center(
          //用 RawGestureDetector 将两个容器包裹起来
          child: RawGestureDetector(
            gestures: {
              AllowMultipleGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<
                  AllowMultipleGestureRecognizer>(
                    () => AllowMultipleGestureRecognizer(),  //构造函数
                    (AllowMultipleGestureRecognizer instance) {  //初始化器
                  instance.onTap = () => print('Episode 8 is best! (nested container)');
                },
              )
            },
            //在第一个容器中创建嵌套容器。
            child: Container(
              color: Colors.yellowAccent,
              width: 300.0,
              height: 400.0,
            ),
          ),
        ),
      ),
    );
  }
}

// 自定义手势识别器。
// 重写 rejectGesture()。当一个手势被拒绝时，将调用此函数。默认情况下，它会处理
// 识别器并进行清理。但是我们修改了它，它实际上是手动添加的，以代替识别器被处理。
// 结果是你将有两个识别器在竞技场中获胜。这是双赢。
class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
