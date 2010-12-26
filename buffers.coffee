buffers =
  splatter: '''
    n = 16

    createAxis("100%","100%",40)

    cube = (x) -> pow(x,3)
    pos  =-> 500 + cube (15 * (random()-0.5))
    size =-> cube 4.5*random()

    circles = set()
    for i in [1..n]
      circles.push circle(pos(),pos(),size())
      .attr
        fill: color = getColor()
        opacity: 0.6
        "stroke": "#333"
        "stroke-width": 1
        "stroke-opacity": 0

    circles.mouseover ->
      this.attr
        "stroke-opacity": 1
        opacity:0.85
        cursor: "pointer"
    circles.mouseout ->
      this.anim
        "stroke-opacity": 0
        opacity:0.6
        cursor: "pointer"
        duration: 140
            '''
  spiral:   '''
    n = 100

    createAxis("100%","100%",40)

    posx = (x) -> 800 + 9*i*sin(pi/12*i)
    posy = (x) -> 500 + 9*i*cos(pi/12*i)
    size = (x) -> x/2 + 1

    circles = set()
    for i in [1..n]
      circles.push circle(posx(i),posy(i),size(i))
      .attr
        fill: color = getColor()
        opacity: 0.6
        "stroke": "#333"
        "stroke-width": 1
        "stroke-opacity": 0
            '''
  chart:   '''
    values = []
    dotsy = []
    clr = []
    c = path("M0,0").attr
      fill: "none"
      "stroke-width": 3

    for i in [0..12]
      values[i] = randomPath(30, i)
      clr[i] = Raphael.getColor()
      c.attr({path: values[i], stroke: clr[i]})
          '''

$(document).ready ->
  $("#show").toggle( ->
    $('#show').html "Hide Code"
    $("#code").fadeIn()
  , ->
    $('#show').html "Show Code"
    $("#code").fadeOut()
  )
  $("#buffers").change( ->
    buffer = $(this).val()
    $("#code").html buffers[buffer]
  )
  # When buffer selected on reload
  buffer = $("#buffers").val()
  $("#code").html buffers[buffer]
