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
          // console.log('111111--2'); 是同步代码，优先于微任务执行。
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

      Button('increase count 5')
        .onClick(() => {
          let response = this.fn5();
        })

      Button('increase count 6')
        .onClick(() => {
          let response = this.fn6();
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

  fn5() {
    new Promise<string>((resolve: Function) => {
      console.log('111111--1'); // 宏任务
      setTimeout(() => {
        console.log('111111--4'); // 宏任务
        resolve('111111--4');
      }, 3000);
    }).then((value) => {
      console.log('111111--5', value); // 微任务
    });
    // 宏任务的执行顺序并不是基于定义的先后，而是基于触发时间。即使某个任务先添加到队列中，但它未到触发时间，事件循环会先执行那些已经到触发时间的任务。
    setTimeout(() => {
      console.log('111111--3'); // 宏任务
    }, 50);
    console.log('111111--2'); // 同步代码
  }

  fn6() {
    new Promise<string>((resolve, reject) => {
      resolve('111111--1');
    }).then((value) => {
      console.log('111111--3', value);
    });
    setTimeout(() => {
      console.log('111111--4');
    }, 0);
    console.log('111111--2');
  }

  fn(): Promise<string> {
    return new Promise<string>((resolve: Function, reject: Function) => {
      // 保存成私有成员变量，同时增加一个强引用
      console.log('111111--1');
      // 将 Promise 状态置为 resolved，并将 .then() 中的回调任务排入微任务队列。
      // 将then中传入的block加入微任务队列，微任务队列中的任务会在当前所有同步任务执行完毕后、下一次事件循环开始前执行。
      // Promise 的回调是微任务，而微任务的执行总是在当前同步任务执行完毕之后进行。
      // JavaScript 是单线程语言，主线程会优先执行同步代码。
      // 异步操作（包括 Promise 的 .then() 回调）被放入队列等待主线程空闲时再处理。
      // resolve 的执行会立即改变 Promise 的状态，但不会立即触发 .then() 回调。
      // .then() 回调是微任务，它会在当前同步代码执行完毕后再执行。
      // 每完成一个宏任务后，JavaScript 引擎会先清空微任务队列，再开始下一个宏任务。
      // 事件循环规则 决定了同步代码优先于异步代码执行，异步代码再分为微任务和宏任务，微任务优先于宏任务执行。
      // JavaScript 的事件循环分为宏任务（macrotask）和微任务（microtask）：
      // 宏任务：setTimeout、setInterval、I/O 操作等。
      // 微任务：Promise.then、MutationObserver 等。
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
