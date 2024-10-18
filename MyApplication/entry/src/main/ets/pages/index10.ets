

@Entry
@Component
struct AddLog {

  build() {
    Row() {
      Column() {
        Text('click me')
          .fontSize(50)
          .onClick(() => {
          })
          .gesture(LongPressGesture().onAction((event: GestureEvent) => {
            console.log(`长按开始`)
          }).onActionEnd(() => {
            console.log(`长按结束`)
          }).onActionCancel(() => {
            console.log(`长按取消`)
          }))
          .borderWidth(1.1)
      }
      .width('100%')
    }
    .height('100%')
  }
}