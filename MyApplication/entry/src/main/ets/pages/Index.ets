// xxx.ets
@Entry
@Component
struct RowExample {
  build() {
    Column({ space: 5 }) {
      // 设置子视图水平方向的间距为10
      Text('1-space').width('90%').border({ width: 1, color: 0x0000FF})
      Row({ space: 10 }) {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE).border({ width: 1 })
        Row().width('40%').height(50).backgroundColor(0x00FFFF).border({ width: 1 })
      }.width('90%').height(107).border({ width: 1 })

      // 设置子视图垂直方向对齐方式
      Text('2-alignItems(Bottom)').width('80%').border({ width: 1, color: 0x0000FF})
      Row() {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        Row().width('30%').height(50).backgroundColor(0x00FFFF)
      }.width('90%').alignItems(VerticalAlign.Bottom).height('15%').border({ width: 1 })

      // 设置子视图垂直方向对齐方式——默认就是居中对齐
      Text('3-alignItems(Center)').width('90%').border({ width: 1, color: 0x0000FF})
      Row() {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        Row().width('30%').height(60).backgroundColor(0x00FFFF)
      }.width('90%').alignItems(VerticalAlign.Center).height('15%').border({ width: 1 })

      // 设置子视图水平方向对齐方式
      Text('4-justifyContent(End)').width('90%').border({ width: 1, color: 0x0000FF})
      Row() {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        Row().width('30%').height(50).backgroundColor(0x00FFFF)
      }.width('90%').border({ width: 1 }).justifyContent(FlexAlign.End).height(80)

      // 父视图未设置高度时，子视图会充满，子视图高度就是父视图高度
      Text('5-justifyContent(Center)').width('90%').border({ width: 1, color: 0x0000FF})
      Row() {
        Row().width('30%').height(70).backgroundColor(0xAFEEEE)
        Row().width('30%').height(100).backgroundColor(0x00FFFF)
      }.width('60%').border({ width: 1 }).justifyContent(FlexAlign.Center)
    }.width('100%').border({ width: 1 }).borderColor(0xFF0000).alignItems(HorizontalAlign.Start)
  }
}