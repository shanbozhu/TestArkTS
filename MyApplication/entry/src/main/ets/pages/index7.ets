// 监听应用前、后台模式
import common from '@ohos.app.ability.common';
import ApplicationStateChangeCallback from '@ohos.app.ability.ApplicationStateChangeCallback';
import { BusinessError } from '@kit.BasicServicesKit';

/****** 应用前、后台模式切换相关 ******/
let appActiveCallback: ApplicationStateChangeCallback = {
  onApplicationForeground() {
    console.log('[App 前后台监听] - 进入前台')
    // do somethings

  },
  onApplicationBackground() {
    console.log('[App 前后台监听] - 进入后台')
    // do somethings
  }
}

// 监听:应用前、后台模式切换
try {
  let context = getContext(this) as common.UIAbilityContext
  // this.context.getApplicationContext().on('applicationStateChange', appActiveCallback)
  context.getApplicationContext().on('applicationStateChange', appActiveCallback)
} catch (error) {
  console.info(`error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
}

@Entry
@Component
struct MainPage {
  build() {

  }

}