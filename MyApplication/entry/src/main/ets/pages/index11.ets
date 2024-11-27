

@Entry
@Component
struct AddLog {

  build() {
    Row() {
      Column() {
        Text('click me')
          .fontSize(50)
          .onClick(() => {

            let praiseCount = 10;
            let praiseStatus = true;
            // 调用方更新自己列表数据里的模型对象。
            // 比如需要修改本地模型对象里的点赞数量、点赞状态等。
            // praiseStatus ? praiseCount--: praiseCount++;
            praiseStatus ? --praiseCount + 1000 : ++praiseCount;
            console.log('praiseCount', praiseCount);
            praiseStatus = !praiseStatus;
          })
          .borderWidth(1.1)
      }
      .width('100%')
    }
    .height('100%')
  }
}