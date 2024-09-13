// xxx.ets

const TEXTAREA_KEY: string = 'textarea'

@Entry
@Component
struct SheetTransitionExample {
  @State isShow:boolean = false
  @State isShow2:boolean = false
  @State sheetHeight:number = 60;

  @State content: string = ''

  @Builder myBuilder() {
    Column() {
      // Button("change height")
      //   .margin(10)
      //   .fontSize(20)
      //   .onClick(()=>{
      //     this.sheetHeight = 500;
      //   })
      //
      // Button("Set Illegal height")
      //   .margin(10)
      //   .fontSize(20)
      //   .onClick(()=>{
      //     this.sheetHeight = -1;
      //   })
      //
      // Button("close modal 1")
      //   .margin(10)
      //   .fontSize(20)
      //   .onClick(()=>{
      //     this.isShow = false;
      //   })

      TextArea({ placeholder: '写评论', text: this.content })
        .key(TEXTAREA_KEY)
        .maxLines(3)
        .constraintSize({ minHeight: 40 })
        .enableKeyboardOnFocus(true)
        .maxLength(300)
        .onChange((value: string) => {
          this.content = value
        })
        .onAppear(() => {
          focusControl.requestFocus(TEXTAREA_KEY)
        })
        .layoutWeight(1)
        .border({ width:1.1, color:Color.Blue})
        .height(80)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
  }

  build() {
    Column() {
      Button("transition modal 1")
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          height: this.sheetHeight,
          backgroundColor: Color.Green,
          onWillAppear: () => {console.log("BindSheet onWillAppear.")},
          onAppear: () => {console.log("BindSheet onAppear.")},
          onWillDisappear: () => {console.log("BindSheet onWillDisappear.")},
          onDisappear: () => {console.log("BindSheet onDisappear.")},
          maskColor: Color.Gray,
          showClose: false
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}