#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge, shapes
#import fletcher.shapes: rect

#{
  set text(font: "Comic Neue", size: 5pt, weight: 400)
  set align(center)

  diagram(
  node-stroke: 1pt,
  edge-stroke: 1pt,
  node((0,0), [Minecraft Client], name: <client>),
  node((1, 0), [Connection attempt\ to `play.domain.tld`], name: <attempt>),
  node((2, 0), [The client queries the DNS server\ for a record for `play.domain.tld`], name: <dns-query>),
  node((3, 0), [DNS server responds that\ for `play.domain.tld` _A_ record\ pointing to `124.132.42.1` exists], name: <dns-resolve>),
  node((4, 0), [Client connects to `124.132.42.1`\ #text(0.75em, fill: gray)[(:25565, jelikož je to výchozí port)]], name: <join>),
  edge(<client>, <attempt>, "-|>"),
  edge(<attempt>, <dns-query>, "-|>"),
  edge(<dns-query>, <dns-resolve>, "-|>"),
  edge(<dns-resolve>, <join>, "-|>"),
)
}