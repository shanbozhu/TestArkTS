import { inputMethod } from '@kit.IMEKit';

@Entry
@Component
export struct CustomInput {
  @State inputText: string = ''; // inputText作为Text组件要显示的内容。
  private inputController: inputMethod.InputMethodController = inputMethod.getController();

  build() {
    Text(this.inputText) // Text组件作为自会编辑框的文本显示组件。
      .fontSize(16)
      .width('100%')
      .lineHeight(40)
      // .id('customInput')
      .height(45)
      .border({ color: '#554455', radius: 30, width: 1 })
      .maxLines(1)
      .onClick(()=>{
        this.attachAndListener(); // 点击控件
      })
  }

  async attachAndListener() { // 绑定和设置监听
    // focusControl.requestFocus('CustomInput');
    await this.inputController.attach(true, {
      inputAttribute: {
        textInputType: inputMethod.TextInputType.TEXT,
        enterKeyType: inputMethod.EnterKeyType.SEARCH
      }
    });
    this.inputController.on('insertText', (text) => {
      this.inputText += text;
    })
    this.inputController.on('deleteLeft', (length) => {
      this.inputText = this.inputText.substring(0, this.inputText.length - length);
    })
    this.inputController.on('sendKeyboardStatus', (text) => {
      console.log('length', text);
    })
    this.inputController.on('sendFunctionKey', (length) => {
      console.log('length', length);
    })
    this.inputController.on('handleExtendAction', (length) => {
      console.log('length', length);
    })
    this.inputController.on('getTextIndexAtCursor', (): number => {
      console.log('length')
      return 0;
    })

  }
}