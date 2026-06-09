#import "../template.typ": three-line-table, eq-block

= 改进对策

== 中间业务产品方面
#figure(
  image("/resource/logo.png", width: 80%),
  caption: [这是照片的标题],
) <fig-demo> // 这里的标签用于引用

== 中间业务经营观念和管理方面
#figure(
  table(
    columns: (auto, auto),
    [项目], [数据],
    [A], [100],
    [B], [200],
  ),
  caption: [这是表格的标题],
) <tab-data>
引用表格：@tab-data
== 中间业务拓展能力方面
学术论文标准表格：顶线粗、栏目线细、底线粗，无竖线。
#three-line-table(
  columns: (1fr, auto, auto),
  [名称],
  [数量],
  [价格],
  table.hline(stroke: 0.5pt),
  [苹果],
  [3],
  [¥5],
  [香蕉],
  [2],
  [¥3],
)

#eq-block[$ a^2 + b^2 = c^2 $] <eq:pythagoras>
……
