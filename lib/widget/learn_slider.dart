import 'package:flutter/material.dart';
import 'package:learnflutter/widget/slider_shape.dart';

class SliderDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SliderDemoState();
  }
}

class _SliderDemoState extends State<SliderDemo> {
  double _value = 0.0;
  double _value2 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 80),
              child: Slider(
                //最小值
                min: 0.0,
                //最大值
                max: 100.0,
                //每次移动的单位
                divisions: 10,
                //当前值
                value: _value,
                //滑过的进度以及上面显示当前值的颜色
                activeColor: Colors.orange,
                //未滑过的进度条的颜色
                inactiveColor: Colors.black45,
                //显示当前值
                label: 'value：$_value',
                //滑动时触发
                onChanged: (double) {
                  if (mounted)
                    setState(() {
                      _value = double.roundToDouble();
                    });
                },
              ),
            ),
            SliderTheme( //自定义风格
              data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.pink, //进度条滑块左边颜色
                  inactiveTrackColor: Colors.blue, //进度条滑块右边颜色
                  trackShape: RoundSliderTrackShape(radius: 10),//进度条形状,这边自定义两头显示圆角
                  thumbColor: Colors.yellow, //滑块颜色
                  overlayColor: Colors.green, //滑块拖拽时外圈的颜色
                  overlayShape: RoundSliderOverlayShape(//可继承SliderComponentShape自定义形状
                    overlayRadius: 25, //滑块外圈大小
                  ),
                  thumbShape: RoundSliderThumbShape(//可继承SliderComponentShape自定义形状
                    disabledThumbRadius: 15, //禁用是滑块大小
                    enabledThumbRadius: 15, //滑块大小
                  ),
                  inactiveTickMarkColor: Colors.black,
                  tickMarkShape: RoundSliderTickMarkShape(//继承SliderTickMarkShape可自定义刻度形状
                    tickMarkRadius: 4.0,//刻度大小
                  ),
                  showValueIndicator: ShowValueIndicator.onlyForDiscrete,//气泡显示的形式
                  valueIndicatorColor: Colors.red,//气泡颜色
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),//气泡形状
                  valueIndicatorTextStyle: TextStyle(color: Colors.black),//气泡里值的风格
                  trackHeight: 10 //进度条宽度

              ),
              child: Slider(
                value: _value2,
                onChanged: (v) {
                  setState(() => _value2 = v);
                },
                label: "气泡:$_value2",//气泡的值
                divisions: 10, //进度条上显示多少个刻度点
                max: 100,
                min: 0,
              ),
            )

          ],
        ),
      ),
    );
  }
}
