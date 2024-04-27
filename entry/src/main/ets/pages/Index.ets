@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Column() {
      // Card({ content: imageBuilder })
      // cardView1()
      // baseView()
      // stackView1()
      // stackView2()
      // flexView1()
      // gridView1()
      // gridView2()
      // clickView()
      // propParent()
      // swiperView()
      // tabview()
      // tabview1()
      // navigationView()
      tabsTest()
    }
    .width('100%').height('100%')
    .backgroundColor('#F1F1F1')
  }
}


//https://blog.csdn.net/yyz_1987/article/details/135854115
@Component
struct tabsTest {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController();

  // 自定义导航页签的样式
  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#28bff1' : '#8a8a8a')
    }
    .width('100%')
    .height(66)
    .backgroundColor()
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex
      this.controller.changeIndex(this.currentIndex)
    })
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          Column() {
            Text("首页").topBarStyle()
            Text("首页").width('100%').height('100%').textAlign(TextAlign.Center).fontSize("25fp")
          }.globalWH()
        }
        .tabBar(this.TabBuilder('首页', 0, $r('app.media.pdj_welfare_selected'), $r('app.media.pdj_welfare_default')))

        TabContent() {
          Column() {
            Text("列表").topBarStyle()
            Text("列表").width('100%').height('100%').textAlign(TextAlign.Center).fontSize("25fp")
          }.globalWH()
        }
        .tabBar(this.TabBuilder('发现', 1, $r('app.media.pdj_find_selected'), $r('app.media.pdj_find_default')))

        TabContent() {
          Column() {
            Text("列表").topBarStyle()
            Text("列表").width('100%').height('100%').textAlign(TextAlign.Center).fontSize("25fp")
          }.globalWH()
        }
        .tabBar(this.TabBuilder('订单', 2, $r('app.media.pdj_order_selected'), $r('app.media.pdj_order_default')))

        TabContent() {
          Column() {
            Text("我的").topBarStyle()
            Text("我的").width('100%').height('100%').textAlign(TextAlign.Center).fontSize("25fp")
          }.globalWH()
        }
        .tabBar(this.TabBuilder('我的', 3, $r('app.media.pdj_my_selected'), $r('app.media.pdj_find_default')))
      }
    }.width('100%').height('100%')
  }
}

@Extend(Column) function globalWH() {
  .size({ width: '100%', height: '100%' })
}

@Extend(Text) function topBarStyle() {
  .size({ width: '100%', height: "60" })
  .fontColor(Color.White)
  .backgroundColor("#28bff1")
  .textAlign(TextAlign.Center)
  .fontSize("22")
}


@Builder  function TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
  Column() {
    Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
      .size({ width: 25, height: 25 })
    Text(title)
      .fontColor(this.currentIndex === targetIndex ? '#28bff1' : '#8a8a8a')
  }.width('100%')
  .height(66)
  .justifyContent(FlexAlign.Center)
  .onClick(() => {
    this.currentIndex = targetIndex
    this.c
  })
}

@Component
struct navigationView {
  private arr: number[] = [1, 2, 3]
  private

  build() {
    Column() {
      Navigation() {
        TextInput({ placeholder: '搜索...' })
          .width('90%').height(44).backgroundColor('#FFFFFF')

        List({ space: 12 }) {
          ForEach(this.arr, (index, item) => {
            ListItem() {
              NavRouter() {
                Text("NavRouter" + item)
                  .width('100%')
                  .height(72)
                  .backgroundColor("#CCE3CB")
                  .borderRadius(16)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text("内容" + item)
                }.width('100%').height('100%').title("内容页" + item)
              }
            }
          }, (item: number) => item.toString())
        }.width('90%').margin({ top: 12 })
      }
      .title("主标题")
      .mode(NavigationMode.Split)
      .titleMode(NavigationTitleMode.Full)
      .menus(
        [
          { value: "", icon: "./pages/images/ic_launcher_round.png", action: () => {
          } },
          { value: "", icon: "./pages/images/ic_launcher_round.png", action: () => {
          } },
          { value: "", icon: "./pages/images/ic_launcher_round.png", action: () => {
          } }
        ])
    }.backgroundColor('#F1F3F5')
  }
}

@Component
struct tabview1 {
  @State index: number = 0
  private tabsController: TabsController = new TabsController()

  @Builder TabBuilder(title: string, targetIndex: number) {
    Column() {
      Text(title).fontColor(this.index == targetIndex ? "#1698CE" : "#6B6B6B")
    }
    .width('100%')
    .height(66)
    .backgroundColor("#CCE3CB")
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.index = targetIndex
      this.tabsController.changeIndex(this.index)
    })
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
        TabContent() {
          Text("首页").fontSize(30)
        }.tabBar(this.TabBuilder("首页", 0))

        TabContent() {
          Text("发现").fontSize(30)
        }.tabBar(this.TabBuilder("发现", 1))

        TabContent() {
          Text("推荐").fontSize(30)
        }.tabBar(this.TabBuilder("推荐", 2))

        TabContent() {
          Text("我的").fontSize(30)
        }.tabBar(this.TabBuilder("我的", 3))
      }.onChange((index) => {
        this.index = index
      })
    }.width('100%').height('100%')
  }
}

@Component
struct tabview {
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          Text("首页").fontSize(30)
        }.tabBar("首页")

        TabContent() {
          Text("发现").fontSize(30)
        }.tabBar("发现")

        TabContent() {
          Text("推荐").fontSize(30)
        }.tabBar("推荐")

        TabContent() {
          Text("我的").fontSize(30)
        }.tabBar("我的")
      }
      //.vertical(false).barWidth(100).barHeight(100).barMode(BarMode.Scrollable)

    }.width('100%').height('100%')
  }
}

@Component
struct swiperView {
  private controlView: SwiperController = new SwiperController()

  build() {
    Column({ space: 10 }) {
      Swiper(this.controlView) {
        Text("1")
          .width('100%')
          .height('100%')
          .fontSize(30)
          .backgroundColor(Color.Gray)
          .textAlign(TextAlign.Center)
        Text("2")
          .width('100%')
          .height('100%')
          .fontSize(30)
          .backgroundColor(Color.Green)
          .textAlign(TextAlign.Center)
        Text("3")
          .width('100%')
          .height('100%')
          .fontSize(30)
          .backgroundColor(Color.Pink)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height('30%')

      Row() {
        Button('Prex').onClick(() => {
          this.controlView.showPrevious()
        })
        Button('Next').onClick(() => {
          this.controlView.showNext()
        })
      }
    }.width('100%').height('100%')
  }
}

@Component
struct propParent {
  // @State count: number = 1;
  @Provide count: number = 1;

  build() {
    Column() {
      Column({ space: 10 }) {
        Text('父组件')
        Row({ space: 22 }) {
          Text('@State')
          Counter() {
            Text(this.count.toString())
          }
          .onInc(() => {
            this.count++
          })
          .onDec(() => {
            this.count--
          })
        }
      }
      // Child({ count: this.count })
      // Child({ count: $count }) // Link
      //
      Child()
    }
    .width('100%')
    .backgroundColor("#CCE3CB")
    .padding(20)
    .borderRadius(20)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
export struct Child {
  // Prop 父向子传递，单向
  // @Prop count: number

  // Link 双向传递，单向
  // @Link count: number

  // 双向传递 双向传递（无需参数）
  @Consume count: number

  build() {
    Column({ space: 10 }) {
      Text('子组件')

      Row({ space: 22 }) {
        Text('@Prop')
        Counter() {
          Text(this.count.toString())
        }
        .onInc(() => {
          this.count++
        })
        .onDec(() => {
          this.count--
        })
      }
    }
    .width('100%')
    .backgroundColor("#255FA7")
    .padding(20)
    .borderRadius(20)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct clickView {
  @State count: number = 1;

  build() {
    Column({ space: 50 }) {
      Row({ space: 22 }) {
        Text('@State')
        Counter() {
          Text(this.count.toString())
        }
        .onInc(() => {
          this.count++
        })
        .onDec(() => {
          this.count--
        })
      }
      .width('100%')
      .backgroundColor("#CCE3CB")
      .padding(20)
      .borderRadius(20)
      .justifyContent(FlexAlign.Center)
    }
  }
}

@Component
struct gridView2 {
  build() {
    Grid() {
      GridItem() {
        Text("1").itemTextStyle()
      }.rowStart(0).rowEnd(1).columnStart(0).columnEnd(1)

      GridItem() {
        Text("2").itemTextStyle()
      }

      GridItem() {
        Text("3").itemTextStyle()
      }

      GridItem() {
        Text("4").itemTextStyle()
      }

      GridItem() {
        Text("5").itemTextStyle()
      }.columnStart(1).columnEnd(2)

    }.width(320).height(240)
    .rowsTemplate('1fr 2fr 1fr')
    .columnsTemplate('1fr 2fr 1fr')
  }
}


@Component
struct gridView1 {
  build() {
    Grid() {
      ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item) => {
        GridItem() {
          Text(item.toString()).itemTextStyle()
        }
      })
    }.width(320).height(240)
    .rowsTemplate('1fr 2fr 1fr')
    .columnsTemplate('1fr 2fr 1fr')
  }
}

@Component
struct flexView1 {
  build() {
    Flex({ direction: FlexDirection.RowReverse,
      wrap: FlexWrap.Wrap,
      alignItems: ItemAlign.Auto,
      alignContent: FlexAlign.Center }) {

      Text('1').width(100).height(100).itemTextStyle()
      Text('2').width(100).height(100).itemTextStyle()
      Text('3').width(100).height(100).itemTextStyle()
    }.width(350).height(350).flexStyle()
  }
}

@Component
struct stackView2 {
  build() {
    Column() {
      Stack({ alignContent: Alignment.BottomEnd }) {
        Image($r('app.media.aa')).width('100%').height('100%')
        Image($r('app.media.ic_launcher_round')).width(100).height(100).position({ x: 120, y: 120 })
      }.width(220).height(220)
    }.width('100%').height('100%').justifyContent(FlexAlign.Center)
  }
}

@Component
struct stackView1 {
  build() {
    Stack() {
      Row().width(250).height(250).backgroundColor('#107B02').shadow({ radius: 50 })
      Row().width(200).height(200).backgroundColor('#E66826').shadow({ radius: 50 })
      Row().width(150).height(150).backgroundColor('#255FA7').shadow({ radius: 50 })
    }.width(300).height(300).backgroundColor('#E5E5E5')
  }
}

@Component
struct baseView {
  build() {
    Column() {
      //Header
      Row() {
        Text('Header').fontSize(30)
      }.backgroundColor('#66008000')
      .justifyContent(FlexAlign.Center)
      .height(60)
      .width('100%')

      // Contet
      Row() {
        Text('Content').fontSize(30)
      }.backgroundColor('#66ffa200')
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .layoutWeight(1)

      //Header
      Row() {
        Text('Footer').fontSize(30)
      }.backgroundColor('#66800000')
      .justifyContent(FlexAlign.Center)
      .height(60)
      .width('100%')
    }
  }
}

@Builder function imageBuilder() {
  Column({ space: 22 }) {
    Image($r('app.media.aa')).width('100%').height(120)
    Text('鸿蒙操作系统')
  }
}

@Component
struct cardView1 {
  build() {
    Row() {
      Image($r('app.media.app_icon')).width(44).height(44)
      Text('蓝牙').fontSize(22).margin({ left: 12 })
      Blank()
      Toggle({ type: ToggleType.Switch })
    }.width('100%').height('66').backgroundColor(Color.Pink).padding(5)
  }
}

@Component
struct Card {
  @BuilderParam content: () => void

  build() {
    Column() {
      this.content()
    }.width('90%')
    .padding(6)
    .borderRadius(6)
    .shadow({ radius: 20 })
  }
}

@Component
struct buttonView {
  build() {
    Button('确认', { type: ButtonType.Capsule, stateEffect: true })
      .fontColor(Color.White)

      .width(160)
      .height(50)
  }
}


@Component
struct view2 {
  @State options: string[] = ["苹果", "桃子", "香蕉", "橘子"]
  @State answer: string = "____?"

  build() {
    Column({ space: 20 }) {
      Row() {
        Text("你最喜欢的水果啊").fontSize(25).fontWeight(FontWeight.Bold)
        Text(this.answer).fontSize(25).fontColor(Color.Green)
      }

      ForEach(this.options, (item, string) => {
        Button(item)
          .width(200)
          .backgroundColor(Color.Green)
          .onClick(() => {
            this.answer = item
          })
      })
    }
  }
}


@Component
struct view1 {
  @State isOn: boolean = false

  build() {
    Column({ space: 30 }) {
      if (this.isOn) {
        Image($r('app.media.icon'))
        Image("pages/images/b.png").height(300).width(300).borderRadius(20)
      } else {
        Image("pages/images/q.png").height(300).width(300).borderRadius(20)
      }
      Row({ space: 20 }) {
        Button('开').onClick(() => {
          this.isOn = true
        }).width('50%')

        Button('关').onClick(() => {
          this.isOn = false
        }).width('50%')
      }.margin(10)
      .width('100%')

    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}


@Extend(Text) function itemTextStyle() {
  .textAlign(TextAlign.Center)
  .fontColor(Color.White)
  .fontSize(40)
  .fontWeight(FontWeight.Bold)
  .backgroundColor('#008a00')
  .borderWidth(1)
  .width('100%')
  .height('100%')
}

@Extend(Flex) function flexStyle() {
  .backgroundColor('#F5F5F5')
  .borderWidth(1)
}