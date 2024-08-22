#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge, shapes
#import fletcher.shapes: rect

#{
  set text(font: "Comic Neue", size: 5pt, weight: 400)
  set align(center)  
  diagram(
  node-stroke: 1pt,
  edge-stroke: 1pt,
  node((0,0), [Default Server Address], name: <host>),
  node((-0.5,1), [hostname\ #text(0.65em, fill: gray)[(e.g. node.myhost.com)]], name: <hostname>),
  node((0.5,1), [IPv4\ #text(0.65em,fill: gray)[(e.g. 124.42.4.133)]], name: <ipv4>),
  node((-0.58,2.5), [*CNAME record*\ _name_: `play`\ _target_: `<server hostname>`], name: <hostnamecname>),
  node((0.58,2.5), [*A reclrd*\ _name_: `play`\ _target_: `<server's IPv4>`], name: <ipv4a>),
  edge(<host>, <hostname>, "-|>"),
  edge(<host>, <ipv4>, "-|>"),
  edge(<ipv4>, <ipv4a>, "-|>"),
  edge(<hostname>, <hostnamecname>, "-|>"),
)
}