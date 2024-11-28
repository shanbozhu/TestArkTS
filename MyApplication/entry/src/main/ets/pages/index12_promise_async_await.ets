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

  async fn1(): Promise<string> {
    console.log('111111--0');
    // response = 'value'
    let response = await this.fn();
    console.log('111111--4', response);
    return response;
  }

  async fn2(): Promise<string> {
    console.log('111111--0');
    // response = 'value'
    let response = await this.fn();
    console.log('111111--4', response);
    return new Promise<string>((resolve: Function, reject: Function) => {
      resolve(response);
    });
  }

  // async 用于声明一个异步请求函数，函数内的代码都会被异步处理，将其后的函数的返回值封装成一个 Promise 对象
  // async 用于声明一个异步请求函数，函数内的await修饰后的代码都会被异步处理，将其后的函数的返回值封装成一个 Promise 对象

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
