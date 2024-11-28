import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ViewA {
  @State count: number = 0;

  build() {
    Column() {
      Button('increase count')
        .onClick(() => {
          this.fn().then((value) => {
            // value = 'value';
            console.log('111111--4', value);
          });
          console.log('111111--2');
        })

      Button('increase count 1')
        .onClick(() => {
          let response = this.fn1().then((value) => {
            // value = 'value';
            console.log('111111--5', value);
          });
          console.log('111111--2', response);
        })

      Button('increase count 2')
        .onClick(() => {
          let response = this.fn2().then((value) => {
            // value = 'value';
            console.log('111111--5', value);
          });
          console.log('111111--2', response);
        })

      Button('increase count 3')
        .onClick(() => {
          let response = this.fn3().then((value) => {
            // value = 'value';
            console.log('111111--3', value);
          });
          console.log('111111--2', response);
        })

      Button('increase count 4')
        .onClick(() => {
          let response = this.fn4().then((value) => {
            // value = 'value';
            console.log('111111--3', value);
          });
          console.log('111111--2', response);
        })
    }
  }

  // 当一个函数被标记为 async，它会自动返回一个 Promise 对象。
  // 如果函数返回一个非 Promise 的值，该值会被包装成一个已解决的 Promise。
  // 如果函数返回一个 Promise，它会直接返回这个 Promise。

  // async 函数中的所有语句默认是同步的，只有遇到 await 才会引入异步行为。
  // 函数的返回值始终是一个 Promise，即使函数内没有显式返回 Promise 的值。
  // await 是 async 函数的关键，用来暂停函数的执行直到一个 Promise 完成。

  // await 只是用同步的书写方式来表达异步，实际上它并不会阻塞代码的执行。
  // 这样设计是为了简化异步代码的编写，同时保留同步代码的直观性。✔️

  // async 用于声明一个异步请求函数，函数内的await修饰后的所有代码都会被异步处理，将其后的函数的返回值自动封装成一个 Promise 对象

  // fn1与fn2函数是等价的

  async fn1(): Promise<string> {
    console.log('111111--0');
    // response = 'value'
    let response = await this.fn();
    response = response + 'hello';
    console.log('111111--4', response);
    return response;
  }

  async fn2(): Promise<string> {
    console.log('111111--0');
    // response = 'value'
    let response = await this.fn();
    response = response + 'hello';
    console.log('111111--4', response);
    return new Promise<string>((resolve: Function, reject: Function) => {
      resolve(response);
    });
  }

  async fn3(): Promise<string> {
    console.log('111111--0');
    return 'value';
  }

  fn4(): Promise<string> {
    console.log('111111--0');
    return new Promise<string>((resolve: Function, reject: Function) => {
      console.log('111111--1');
      resolve('value');
    });
  }

  fn(): Promise<string> {
    return new Promise<string>((resolve: Function, reject: Function) => {
      resolve('111111--1');
    }).then((value) => {
      // value = '111111--1';
      console.log('111111--3', value);
      return 'value';
    }).catch((error: BusinessError) => {
      console.log('111111--3', error);
      return 'error';
    });
  }
}
