

@Entry
@Component
struct AddLog {

  build() {
    Row() {
      Column() {
        Text('click me')
          .fontSize(50)
          .onClick(() => {

            // let name1 = null;
            // let name2 = undefined;
            //
            // // 测试 null 和 undefined
            // if (name1) {
            //   console.log(`1111 ${name1}`);
            // }
            // if (name1 != undefined) {
            //   console.log(`1111 ${name1} != undefined`);
            // }
            // if (name1 !== undefined) {
            //   console.log(`1111 ${name1} !== undefined`);
            // }
            // if (name1 == undefined) {
            //   console.log(`1111 ${name1} == undefined`);
            // }
            // if (name1 === undefined) {
            //   console.log(`1111 ${name1} === undefined`);
            // }
            //
            // // 测试 undefined 和 null
            // if (name2) {
            //   console.log(`1111 ${name2}`);
            // }
            // if (name2 != null) {
            //   console.log(`1111 ${name2} != null`);
            // }
            // if (name2 !== null) {
            //   console.log(`1111 ${name2} !== null`);
            // }
            // if (name2 == null) {
            //   console.log(`1111 ${name2} == null`);
            // }
            // if (name2 === null) {
            //   console.log(`1111 ${name2} === null`);
            // }

            console.log('1111', null == undefined) // 1111 true
            console.log('1111', null === undefined); // 1111 false
            console.log('1111', undefined); // 1111 undefined
            console.log('1111', null); // 1111 null
            console.log('1111', !undefined); // 1111 true
            console.log('1111', !null); // 1111 true
            console.log('1111', undefined === true); // 1111 false
            console.log('1111', null === true);  // 1111 false
            console.log('1111', undefined === false); // 1111 false
            console.log('1111', null === false);  // 1111 false
            console.log('1111', (undefined) ? true : false); // 1111 false
            console.log('1111', (null) ? true : false);  // 1111 false

            let obj: string = '';
            // 所以判断对象是否存在
            if (obj != null) {
            }
            // 或
            if (obj != undefined) {
            }
            // 所以判断对象是否不存在
            if (!obj) {
            }
            // 所以判断对象等于某个值
            if (obj === null) {
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}