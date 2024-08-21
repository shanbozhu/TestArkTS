@Entry
@Component
struct ViewA {
  @State count: number = 0;

  build() {
    Column() {
      Text(`count=${this.count}`)

      if (this.count > 0) {
        Text(`count is positive`)
          .fontColor(Color.Green)
      }

      if (this.count > 0) {

      }

      Button('increase count')
        .onClick(() => {
          this.count++;
        })

      Button('decrease count')
        .onClick(() => {
          this.count--;
        })

      if (this.count > 0) {

      }
    }
  }
}