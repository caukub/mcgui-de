#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge, shapes
#import fletcher.shapes: rect

#{
  set text(font: "Comic Neue", size: 5pt, weight: 400)
  set align(center)
  
  diagram(
  node-stroke: 1pt,
  edge-stroke: 1pt,
  node((0,0), [Server Address], name: <host>),
  node((-0.5,1), [hostname\ #text(0.65em, fill: gray)[(e.g. node.myhost.com)]], name: <hostname>),
  node((0.5,1), [IPv4\ #text(0.65em,fill: gray)[(e.g. 124.42.4.133)]], name: <ipv4>),
  node((-1,2), [server port], name: <hostnameport>),
  node((1,2), [server port], name: <ipv4port>),
  node((2,2), [other than 25565\ #text(0.65em,fill:gray)[(both records are required)]], name: <ipv4nondefaultport>),
  node((-1,3), [*CNAME record*\ _name_: `play`\ _target_: `<server hostname>`], name: <hostnamecname>),
  node((0,3), [
    *SRV record*\ 
    _name_: `play`\ _service_: `_minecraft` \ _protocol_: `TCP`\
    _priority_: `0`\ _weight_: `5`\
    _port_: `<server port>`\ _target_: `<server hostname>`
  ], name: <hostnamesrv>, shape: rect),
  node((0,2), [*A record*\ _name_: `play`\ _target_: `<server's IPv4>`], name: <ipv4a>),
  node((1,3), [*A record*\ _name_: `<something>`\ _target_: `<server's IPv4>`], name: <ipv4asrv>),
  node((2,3), [
    *SRV record*\ 
    _name_: `play`\ _service_: `_minecraft`\ _protocol_: `TCP`\ 
    _priority_: `0`\ _weight_: `5`\ _port_: `<server port>`\ 
    _target_: `<something-from-A-record>.mydomain.tld`
  ], name: <ipv4srv>, shape: rect),
  edge(<host>, <hostname>, "-|>"),
  edge(<host>, <ipv4>, "-|>"),
  edge(<hostname>, <hostnameport>, "-|>"),
  edge(<ipv4>, <ipv4port>, "-|>"),
  edge(<hostnameport>, <hostnamecname>, [25565], "-|>"),
  edge(<hostnameport>, <hostnamesrv>, [other than 25565], "-|>"), // todo: align(right) when 0.4.4 released, line spacing (prekryvani)
  edge(<ipv4port>, <ipv4nondefaultport>, "-|>"),
  edge(<ipv4nondefaultport>, <ipv4asrv>, "-|>"),
  edge(<ipv4nondefaultport>, <ipv4srv>, "-|>"),
  edge(<ipv4port>, <ipv4a>, [25565], "-|>"),
)
}