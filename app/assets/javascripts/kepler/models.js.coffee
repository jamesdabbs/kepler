show_node = (node) ->
  console.log node

window.Graph = class Graph
  constructor: (@data) ->

  draw: (width, height) ->
    force = d3.layout.force()
        .charge(-150)
        .linkDistance(70)
        .size([width, height])
        .nodes(@data.nodes)
        .links(@data.links)
        .start()

    svg = d3.select("#content").append("svg")
        .attr("width", width)
        .attr("height", height)

    link = svg.selectAll("line.link")
        .data(@data.links)
      .enter()
        .append("line")
        .attr("class", "link")
        .style("stroke-width", 1.2)

    node = svg.selectAll("circle.node")
        .data(@data.nodes)
      .enter()
        .append("circle")
        .attr("class", "node")
        .attr("r", 5)
        .style("fill", "#1f77b4")
        .call(force.drag)
        .on("mouseover", show_node)
    
    node.append("title").text (d) -> d.name

    force.on "tick", ->
      link
        .attr("x1", (d) -> d.source.x)
        .attr("y1", (d) -> d.source.y)
        .attr("x2", (d) -> d.target.x)
        .attr("y2", (d) -> d.target.y)

      node
        .attr("cx", (d) -> d.x)
        .attr("cy", (d) -> d.y)