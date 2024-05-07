@Entry
@Component
export struct Home {
  @State message: string = 'Hello World Home'

  build() {
    Column() {
      Text("首页").topBarStyle()
      Text("首页").width('100%').height('100%').textAlign(TextAlign.Center).fontSize("25fp")
    }.globalWH()
  }
}

@Extend(Column) function globalWH() {
  .size({ width: '100%', height: '100%' })
  .backgroundColor('#F1F3F5')
}

@Extend(Text) function topBarStyle() {
  .size({ width: '100%', height: "60" })
  .fontColor(Color.White)
  .backgroundColor("#28bff1")
  .textAlign(TextAlign.Center)
  .fontSize("22")
}
}