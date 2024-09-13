import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, window } from '@kit.ArkUI';

class Params {
  size: number = 0
  constructor(size: number) {
    this.size = size;
  }
}

@Component
struct InputComp {
  params?: Params

  aboutToDisappear(): void {
    window.getLastWindow(getContext(this)).then(lastWindow => {
      lastWindow.off('keyboardHeightChange', (size: number) => {
        console.log('关闭'+size)
      })
    }).catch((err: BusinessError) => {
      console.log('chen size==='+err)
    })
  }

  aboutToAppear(): void {
    window.getLastWindow(getContext(this)).then(lastWindow => {
      lastWindow.on('keyboardHeightChange', (size: number) => {
        // 虽然上一个 this 已经走了 aboutToDisappear ，但是再次弹出面板时，上一个 this 竟然还有值，能响应此处的事件，这是为何？？？？？
        console.log('开启'+size)
      })
    }).catch((err: BusinessError) => {
      console.log('chen size==='+err)
    })
  }

  build() {
    Column() {
      TextArea()
        .borderWidth(1.1)
    }.backgroundColor('#FFF0F0F0')
    .defaultFocus(true)
    .height(100)
    .margin(this.params?.size)
    .gesture(
      PanGesture()
        .onActionStart(() => {
          console.info('TapGesture is onAction');
        }))
  }
}

@Builder
function buildText(params: Params) {
  InputComp({
    params: params
  })
}

@Entry
@Component
struct Index {
  @State msize: number = 0

  build() {
    Row() {
      Column() {
        Button("click me")
          .onClick(() => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params(this.msize));
            try {
              promptAction.openCustomDialog(contentNode, {
                alignment: DialogAlignment.Bottom,
                onWillDismiss: (action: DismissDialogAction) => {
                  contentNode.dispose() // 销毁
                  action.dismiss();
                }
              });
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`OpenCustomDialog args error code is ${code}, message is ${message}`);
            };
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}