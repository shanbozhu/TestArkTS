import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, window } from '@kit.ArkUI';



@Entry
@Component
struct Index {

  build() {
    Row() {
      Column() {
        Button("click me")
          .onClick(() => {

            // 1
            let rep: RegExp = /\[[0-9a-zA-Z\u4e00-\u9fa5]+]/g;
            let s: string = "[吃瓜]😀哈[互粉][中国队加油]😀";
            let ret = s.matchAll(rep);
            console.log('Found match', ret);
            for (const match of ret) {
              console.log(`Found match: ${match.index}, ${match.input}, ${match.length}`);
              console.log(`Found match: ${match[0]}, captured group: ${match[1]}`);
              console.log(`Found match: ${match[0].length}`);
            }

            // 2
            // 使用 replace 配合回调函数
            const result1 = s.replace(rep, (match, num: string) => {
              return `[resource://RAWFILE/001xin.webp_${num}]`; // 将匹配项替换为指定内容
            });
            console.log('Found match', result1); // 输出: "[resource://RAWFILE/001xin.webp_0]😀哈[resource://RAWFILE/001xin.webp_7][resource://RAWFILE/001xin.webp_11]😀"

            // 3
            const text = "abc 123 def  456";
            const regex = /\b(\d+)\b/g;
            // 使用 replace 配合回调函数
            const result = text.replace(regex, (match, num: string) => {
              console.log('Found match', match, num);
              return `[${num}]`; // 将匹配项替换为指定内容
            });
            console.log('Found match', result); // 输出: "abc [123] def [456]"
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}